% analysis_figures_for_paper Functions to make figures for paper



% For the dynamic moving ripple response files ('dmr1', 'dmr2', 'dmr3')

% Starting from the spike sorted data contained in the .mdl/.spk files

1. Save .spk and .mdl files in *-spk.mat files.

2. Get trigger for stimulus and save in *-trig.mat file.

2'. Fix inter-spike intervals using: spknew = iccp_isi_filtered_spk(spk, delay);
Or, if *-strfcmb-pairs.mat files already exist, then you can modify them using
iccp_fix_strf_spk_isi.m

3. Estimate spectrotemporal receptive fields using calculate_strf.m

4. Estimate strf parameters using strf_parameters.m

5. Estimate modulation transfer function parameters for each strf using ripple_transfer_function.m

6. Estimate pure tone params using strf_pure_tone_params.m

7. Estimate nonlinearity using iccp_batch_sta_nonlinearity.m

8. Fit curves to nonlinearities using iccp_batch_sta_fio_fitParams.m

9. Estimate functional connectivity using iccp_batch_channel_corr.m
This is a batch function which processes all data files in the current
folder. It calls two functions:
    [pairstrains] = iccp_get_spk_paired_data(spk);
    [ccpairs] = iccp_calc_spk_crosscorr(pairstrains);
 
10. After this processing is complete, plotting function may be used to
analyze the results.



The following are for data where the pair of neurons exhibited 
significant synchrony within 1 ms of 0 delay.

For fra parameter plots:

Move to directory D:\ICC_Pairs_Data\fra
then run:

fradata = iccpairs_ccpairs_select_max_plot_fra_params;

For population plots:

iccpairs_plot_fradata_cf_resptype(fradata);
iccpairs_plot_fradata_bw(fradata);
iccpairs_plot_fradata_q(fradata);



For STRF parameter plots:

[rfdata] = iccpairs_ccpairs_select_max_plot_strf_params(rfdata)
iccpairs_plot_rfdata_fr_pli(rfdata)
iccpairs_plot_ptdata_cf_q_latency(ptdata) 

[mtfdata] = iccpairs_ccpairs_select_max_strf_bmf(rfdata)
iccpairs_plot_mtfdata_btmf_bsmf(mtfdata)
iccpairs_plot_fiodata(fiodata)








