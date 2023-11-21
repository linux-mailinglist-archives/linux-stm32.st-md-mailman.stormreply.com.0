Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2C57F3EBD
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Nov 2023 08:16:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4FF7C6B47D;
	Wed, 22 Nov 2023 07:16:20 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B2FEC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 20:25:37 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-41cb7720579so61311cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 12:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700598336; x=1701203136;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iCMzoRfb4a3/ugx1ekrNo7I7m5M5cti/B9DKAeOZo/A=;
 b=RGT1xkbzBMcZwaqpfdSWtCKpsMwl8wy42iTNFeExOzl0KFiBKYcfzMBuJ5BL3FUKAF
 +Qg9zXZaS2hWyrLnph+Enr01FSMEwbHHNEyDRn/QzGyheK9pER6KKrEA0H07yk0f/iTt
 tQgAMCzY9gRsiQmz9KqD7sEpTiowapU8mOscY3nrkrPpfmFyHUY2KeEb4C/LAHQb1WYZ
 /Krv2XdvECEvii1uprRNNYpDbvwaxfEiYqJjJ+ukYmD16eyyUZaLJSU2r3yF/jT9eF2n
 bhZ1yv87mjlNQA+sbJoei8vXMmWf7jEUWQ+bLWmvKIm3mfbEmiGDC4MwEGkoHhWNdino
 2NwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700598336; x=1701203136;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iCMzoRfb4a3/ugx1ekrNo7I7m5M5cti/B9DKAeOZo/A=;
 b=p9AKeLnTTVm8wOALQsBew4AazNVL84ZBejG89hCD99aAMoVDfPcSKm4KmQRXJoR0zK
 A6aqR3IxtAjpn4pfkHmMeOGYMRcKU00C/9hjGuEruyMnqWQYgn4Jgy8a/Ipgo4VrE970
 1YZD2BpJI/NREfkwfjAoboa8e5VRp6nhjXvu1Tx9BzzZC2ImlLYvOz+dd2YeceKHxR3c
 2WRjn/A7dkNViJGAt63GVhgZc8mOyQ+M7yIBUhA2PARkjrnlbxQuzdmNbCbgrwej0lp5
 hXzchGmKTu8rOjHG/81UIX1PUIRZYjcxSCezxr65+ZlzlGSdapeV0mO3uSaMvi1NGnLe
 aoKA==
X-Gm-Message-State: AOJu0YzDkqSdwgmxVuURJNaAuXBrKb7Yzopcg1wV2YmO1VVHdXs45ur3
 jlYLJQe/FOixwDN4o7oraHQuD+yjVhQzLjB3KV5Z1Q==
X-Google-Smtp-Source: AGHT+IEXOgEnuQYmOo/j6jGdP7uaNjQGfB0xDc6+hio8YQgV8gwZcFjbdbKJsHiGfuzgy6VpoOGKycSBvEODSFw0dNA=
X-Received: by 2002:a05:622a:13ca:b0:421:bc7d:dc84 with SMTP id
 p10-20020a05622a13ca00b00421bc7ddc84mr38799qtk.2.1700598336078; Tue, 21 Nov
 2023 12:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20231121184543.3433940-1-sgzhang@google.com>
 <84be10f3-0880-4ccd-b6d3-b5feecea75ef@lunn.ch>
In-Reply-To: <84be10f3-0880-4ccd-b6d3-b5feecea75ef@lunn.ch>
From: Ray Zhang <sgzhang@google.com>
Date: Tue, 21 Nov 2023 12:25:25 -0800
Message-ID: <CAPqVEOAGCtneC1kzER1=o-NwRR_eh5vEk_66BEM6+cYkrdJdVg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailman-Approved-At: Wed, 22 Nov 2023 07:16:18 +0000
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix out-of-bounds read via
 memcpy detected by KASAN
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0923739798731714706=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============0923739798731714706==
Content-Type: multipart/alternative; boundary="000000000000baae0d060aaf67b3"

--000000000000baae0d060aaf67b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 11:46=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:

> On Tue, Nov 21, 2023 at 06:45:43PM +0000, Ray Zhang wrote:
> > CONFIG_KASAN detected out-of-bounds read via memcpy in
> stmmac_get_strings.
> > The fix is to change memcpy to strscpy.
> >
> > Tested:
> > <machine_obfuscated>:~# ethtool -i <interface_obfuscated>
> > driver: st_gmac
> > <machine_obfuscated>:~# ethtool -S <interface_obfuscated>
> > NIC statistics:
> >      ATPES: 0
> >      TPES: 0
> >      RDPES: 0
> >      MPES: 0
> >      MTSPES: 0
> >      ARPES: 0
> >      CWPES: 0
> >      ASRPES: 0
> >      TTES: 0
> >      RTES: 0
> >      CTES: 0
> >      ATES: 0
> >      PTES: 0
> >      T125ES: 0
> >      R125ES: 0
> >      RVCTES: 0
> >      MSTTES: 0
> >      SLVTES: 0
> >      ATITES: 0
> >      ARITES: 0
> >      FSMPES: 0
> >      TXCES: 0
> >      TXAMS: 0
> >      TXUES: 0
> >      RXCES: 0
> >      RXAMS: 0
> >      RXUES: 0
> >      ECES: 0
> >      EAMS: 0
> >      EUES: 0
> >      RPCES: 0
> >      RPAMS: 0
> >      RPUES: 0
> >      TCES: 0
> >      TAMS: 0
> >      TUES: 0
> >      mmc_tx_octetcount_gb: 11612
> >      mmc_tx_framecount_gb: 100
> >      mmc_tx_broadcastframe_g: 0
> >      mmc_tx_multicastframe_g: 42
> >      mmc_tx_64_octets_gb: 0
> >      mmc_tx_65_to_127_octets_gb: 62
> >      mmc_tx_128_to_255_octets_gb: 38
> >      mmc_tx_256_to_511_octets_gb: 0
> >      mmc_tx_512_to_1023_octets_gb: 0
> >      mmc_tx_1024_to_max_octets_gb: 0
> >      mmc_tx_unicast_gb: 58
> >      mmc_tx_multicast_gb: 42
> >      mmc_tx_broadcast_gb: 0
> >      mmc_tx_underflow_error: 0
> >      mmc_tx_singlecol_g: 0
> >      mmc_tx_multicol_g: 0
> >      mmc_tx_deferred: 0
> >      mmc_tx_latecol: 0
> >      mmc_tx_exesscol: 0
> >      mmc_tx_carrier_error: 0
> >      mmc_tx_octetcount_g: 11612
> >      mmc_tx_framecount_g: 100
> >      mmc_tx_excessdef: 0
> >      mmc_tx_pause_frame: 0
> >      mmc_tx_vlan_frame_g: 0
> >      mmc_rx_framecount_gb: 64
> >      mmc_rx_octetcount_gb: 30235
> >      mmc_rx_octetcount_g: 30235
> >      mmc_rx_broadcastframe_g: 0
> >      mmc_rx_multicastframe_g: 0
> >      mmc_rx_crc_error: 0
> >      mmc_rx_align_error: 0
> >      mmc_rx_run_error: 0
> >      mmc_rx_jabber_error: 0
> >      mmc_rx_undersize_g: 0
> >      mmc_rx_oversize_g: 0
> >      mmc_rx_64_octets_gb: 0
> >      mmc_rx_65_to_127_octets_gb: 9
> >      mmc_rx_128_to_255_octets_gb: 22
> >      mmc_rx_256_to_511_octets_gb: 21
> >      mmc_rx_512_to_1023_octets_gb: 2
> >      mmc_rx_1024_to_max_octets_gb: 10
> >      mmc_rx_unicast_g: 64
> >      mmc_rx_length_error: 0
> >      mmc_rx_autofrangetype: 0
> >      mmc_rx_pause_frames: 0
> >      mmc_rx_fifo_overflow: 0
> >      mmc_rx_vlan_frames_gb: 0
> >      mmc_rx_watchdog_error: 0
> >      mmc_rx_ipc_intr_mask: 0
> >      mmc_rx_ipc_intr: 0
> >      mmc_rx_ipv4_gd: 0
> >      mmc_rx_ipv4_hderr: 0
> >      mmc_rx_ipv4_nopay: 0
> >      mmc_rx_ipv4_frag: 0
> >      mmc_rx_ipv4_udsbl: 0
> >      mmc_rx_ipv4_gd_octets: 0
> >      mmc_rx_ipv4_hderr_octets: 0
> >      mmc_rx_ipv4_nopay_octets: 0
> >      mmc_rx_ipv4_frag_octets: 0
> >      mmc_rx_ipv4_udsbl_octets: 0
> >      mmc_rx_ipv6_gd_octets: 0
> >      mmc_rx_ipv6_hderr_octets: 0
> >      mmc_rx_ipv6_nopay_octets: 0
> >      mmc_rx_ipv6_gd: 0
> >      mmc_rx_ipv6_hderr: 0
> >      mmc_rx_ipv6_nopay: 0
> >      mmc_rx_udp_gd: 0
> >      mmc_rx_udp_err: 0
> >      mmc_rx_tcp_gd: 0
> >      mmc_rx_tcp_err: 0
> >      mmc_rx_icmp_gd: 0
> >      mmc_rx_icmp_err: 0
> >      mmc_rx_udp_gd_octets: 0
> >      mmc_rx_udp_err_octets: 0
> >      mmc_rx_tcp_gd_octets: 0
> >      mmc_rx_tcp_err_octets: 0
> >      mmc_rx_icmp_gd_octets: 0
> >      mmc_rx_icmp_err_octets: 0
> >      mmc_tx_fpe_fragment_cntr: 0
> >      mmc_tx_hold_req_cntr: 0
> >      mmc_rx_packet_assembly_err_cntr: 0
> >      mmc_rx_packet_smd_err_cntr: 0
> >      mmc_rx_packet_assembly_ok_cntr: 0
> >      mmc_rx_fpe_fragment_cntr: 0
> >      tx_underflow: 0
> >      tx_carrier: 0
> >      tx_losscarrier: 0
> >      vlan_tag: 0
> >      tx_deferred: 0
> >      tx_vlan: 0
> >      tx_jabber: 0
> >      tx_frame_flushed: 0
> >      tx_payload_error: 0
> >      tx_ip_header_error: 0
> >      rx_desc: 0
> >      sa_filter_fail: 0
> >      overflow_error: 0
> >      ipc_csum_error: 0
> >      rx_collision: 0
> >      rx_crc_errors: 0
> >      dribbling_bit: 0
> >      rx_length: 0
> >      rx_mii: 0
> >      rx_multicast: 0
> >      rx_gmac_overflow: 0
> >      rx_watchdog: 0
> >      da_rx_filter_fail: 0
> >      sa_rx_filter_fail: 0
> >      rx_missed_cntr: 0
> >      rx_overflow_cntr: 0
> >      rx_vlan: 0
> >      rx_split_hdr_pkt_n: 0
> >      tx_undeflow_irq: 0
> >      tx_process_stopped_irq: 0
> >      tx_jabber_irq: 0
> >      rx_overflow_irq: 0
> >      rx_buf_unav_irq: 0
> >      rx_process_stopped_irq: 0
> >      rx_watchdog_irq: 0
> >      tx_early_irq: 0
> >      fatal_bus_error_irq: 0
> >      rx_early_irq: 0
> >      threshold: 64
> >      tx_pkt_n: 100
> >      rx_pkt_n: 64
> >      normal_irq_n: 62
> >      rx_normal_irq_n: 58
> >      napi_poll: 215
> >      tx_normal_irq_n: 4
> >      tx_clean: 157
> >      tx_set_ic_bit: 4
> >      irq_receive_pmt_irq_n: 0
> >      mmc_tx_irq_n: 0
> >      mmc_rx_irq_n: 0
> >      mmc_rx_csum_offload_irq_n: 0
> >      irq_tx_path_in_lpi_mode_n: 0
> >      irq_tx_path_exit_lpi_mode_n: 0
> >      irq_rx_path_in_lpi_mode_n: 0
> >      irq_rx_path_exit_lpi_mode_n: 0
> >      phy_eee_wakeup_error_n: 0
> >      ip_hdr_err: 0
> >      ip_payload_err: 0
> >      ip_csum_bypassed: 0
> >      ipv4_pkt_rcvd: 0
> >      ipv6_pkt_rcvd: 64
> >      no_ptp_rx_msg_type_ext: 64
> >      ptp_rx_msg_type_sync: 0
> >      ptp_rx_msg_type_follow_up: 0
> >      ptp_rx_msg_type_delay_req: 0
> >      ptp_rx_msg_type_delay_resp: 0
> >      ptp_rx_msg_type_pdelay_req: 0
> >      ptp_rx_msg_type_pdelay_resp: 0
> >      ptp_rx_msg_type_pdelay_follow_up: 0
> >      ptp_rx_msg_type_announce: 0
> >      ptp_rx_msg_type_management: 0
> >      ptp_rx_msg_pkt_reserved_type: 0
> >      ptp_frame_type: 0
> >      ptp_ver: 0
> >      timestamp_dropped: 0
> >      av_pkt_rcvd: 0
> >      av_tagged_pkt_rcvd: 0
> >      vlan_tag_priority_val: 0
> >      l3_filter_match: 0
> >      l4_filter_match: 0
> >      l3_l4_filter_no_match: 0
> >      irq_pcs_ane_n: 0
> >      irq_pcs_link_n: 0
> >      irq_rgmii_n: 0
> >      mtl_tx_status_fifo_full: 0
> >      mtl_tx_fifo_not_empty: 0
> >      mmtl_fifo_ctrl: 0
> >      mtl_tx_fifo_read_ctrl_write: 0
> >      mtl_tx_fifo_read_ctrl_wait: 0
> >      mtl_tx_fifo_read_ctrl_read: 0
> >      mtl_tx_fifo_read_ctrl_idle: 0
> >      mac_tx_in_pause: 0
> >      mac_tx_frame_ctrl_xfer: 0
> >      mac_tx_frame_ctrl_idle: 0
> >      mac_tx_frame_ctrl_wait: 0
> >      mac_tx_frame_ctrl_pause: 0
> >      mac_gmii_tx_proto_engine: 0
> >      mtl_rx_fifo_fill_level_full: 0
> >      mtl_rx_fifo_fill_above_thresh: 0
> >      mtl_rx_fifo_fill_below_thresh: 0
> >      mtl_rx_fifo_fill_level_empty: 0
> >      mtl_rx_fifo_read_ctrl_flush: 0
> >      mtl_rx_fifo_read_ctrl_read_data: 0
> >      mtl_rx_fifo_read_ctrl_status: 0
> >      mtl_rx_fifo_read_ctrl_idle: 0
> >      mtl_rx_fifo_ctrl_active: 0
> >      mac_rx_frame_ctrl_fifo: 0
> >      mac_gmii_rx_proto_engine: 0
> >      tx_tso_frames: 0
> >      tx_tso_nfrags: 0
> >      mtl_est_cgce: 0
> >      mtl_est_hlbs: 0
> >      mtl_est_hlbf: 0
> >      mtl_est_btre: 0
> >      mtl_est_btrlm: 0
> >      q0_tx_pkt_n: 100
> >      q0_tx_irq_n: 4
> >      q0_rx_pkt_n: 64
> >      q0_rx_irq_n: 58
>
> What useful information does this list of statistics bring in the
> commit message?
>
> Each output line of "ethtool -S" is from the modified code: It shows the
command still yields normal output results as expected.


> >                               if (!stmmac_safety_feat_dump(priv,
> >                                                       &priv->sstats, i,
> >                                                       NULL, &desc)) {
> > -                                     memcpy(p, desc, ETH_GSTRING_LEN);
> > +                                     strscpy(p, desc, ETH_GSTRING_LEN)=
;
>
> Did you consider ethtool_puts() ?

No, since strscpy does the job already. Also I could not find ethtool_puts:
where is it defined? Or do you mean ethtool_put_stat, which is
inappropriate to use here since it requires a skb parameter?


>     Andrew
>
> ---
> pw-bot: cr
>

Hi Andrew, Thanks for reviewing, please see inline.

Ray

--000000000000baae0d060aaf67b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 21, 2023 at 11:46=E2=80=AFAM =
Andrew Lunn &lt;<a href=3D"mailto:andrew@lunn.ch" target=3D"_blank">andrew@=
lunn.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, Nov 21, 2023 at 06:45:43PM +0000, Ray Zhang wrote:<br>
&gt; CONFIG_KASAN detected out-of-bounds read via memcpy in stmmac_get_stri=
ngs.<br>
&gt; The fix is to change memcpy to strscpy.<br>
&gt; <br>
&gt; Tested:<br>
&gt; &lt;machine_obfuscated&gt;:~# ethtool -i &lt;interface_obfuscated&gt;<=
br>
&gt; driver: st_gmac<br>
&gt; &lt;machine_obfuscated&gt;:~# ethtool -S &lt;interface_obfuscated&gt;<=
br>
&gt; NIC statistics:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ATPES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TPES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RDPES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MPES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MTSPES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARPES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CWPES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ASRPES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TTES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RTES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CTES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ATES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PTES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 T125ES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 R125ES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RVCTES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MSTTES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SLVTES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ATITES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARITES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FSMPES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TXCES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TXAMS: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TXUES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RXCES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RXAMS: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RXUES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ECES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EAMS: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EUES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RPCES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RPAMS: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RPUES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TCES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TAMS: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TUES: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_octetcount_gb: 11612<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_framecount_gb: 100<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_broadcastframe_g: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_multicastframe_g: 42<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_64_octets_gb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_65_to_127_octets_gb: 62<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_128_to_255_octets_gb: 38<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_256_to_511_octets_gb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_512_to_1023_octets_gb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_1024_to_max_octets_gb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_unicast_gb: 58<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_multicast_gb: 42<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_broadcast_gb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_underflow_error: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_singlecol_g: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_multicol_g: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_deferred: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_latecol: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_exesscol: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_carrier_error: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_octetcount_g: 11612<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_framecount_g: 100<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_excessdef: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_pause_frame: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_vlan_frame_g: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_framecount_gb: 64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_octetcount_gb: 30235<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_octetcount_g: 30235<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_broadcastframe_g: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_multicastframe_g: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_crc_error: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_align_error: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_run_error: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_jabber_error: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_undersize_g: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_oversize_g: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_64_octets_gb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_65_to_127_octets_gb: 9<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_128_to_255_octets_gb: 22<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_256_to_511_octets_gb: 21<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_512_to_1023_octets_gb: 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_1024_to_max_octets_gb: 10<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_unicast_g: 64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_length_error: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_autofrangetype: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_pause_frames: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_fifo_overflow: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_vlan_frames_gb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_watchdog_error: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipc_intr_mask: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipc_intr: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv4_gd: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv4_hderr: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv4_nopay: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv4_frag: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv4_udsbl: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv4_gd_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv4_hderr_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv4_nopay_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv4_frag_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv4_udsbl_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv6_gd_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv6_hderr_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv6_nopay_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv6_gd: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv6_hderr: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_ipv6_nopay: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_udp_gd: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_udp_err: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_tcp_gd: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_tcp_err: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_icmp_gd: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_icmp_err: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_udp_gd_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_udp_err_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_tcp_gd_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_tcp_err_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_icmp_gd_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_icmp_err_octets: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_fpe_fragment_cntr: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_hold_req_cntr: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_packet_assembly_err_cntr: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_packet_smd_err_cntr: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_packet_assembly_ok_cntr: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_fpe_fragment_cntr: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_underflow: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_carrier: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_losscarrier: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 vlan_tag: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_deferred: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_vlan: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_jabber: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_frame_flushed: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_payload_error: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_ip_header_error: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_desc: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sa_filter_fail: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 overflow_error: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ipc_csum_error: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_collision: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_crc_errors: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dribbling_bit: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_length: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_mii: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_multicast: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_gmac_overflow: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_watchdog: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 da_rx_filter_fail: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sa_rx_filter_fail: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_missed_cntr: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_overflow_cntr: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_vlan: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_split_hdr_pkt_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_undeflow_irq: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_process_stopped_irq: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_jabber_irq: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_overflow_irq: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_buf_unav_irq: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_process_stopped_irq: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_watchdog_irq: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_early_irq: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fatal_bus_error_irq: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_early_irq: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 threshold: 64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_pkt_n: 100<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_pkt_n: 64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 normal_irq_n: 62<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rx_normal_irq_n: 58<br>
&gt;=C2=A0 =C2=A0 =C2=A0 napi_poll: 215<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_normal_irq_n: 4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_clean: 157<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_set_ic_bit: 4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 irq_receive_pmt_irq_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_tx_irq_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_irq_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmc_rx_csum_offload_irq_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 irq_tx_path_in_lpi_mode_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 irq_tx_path_exit_lpi_mode_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 irq_rx_path_in_lpi_mode_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 irq_rx_path_exit_lpi_mode_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 phy_eee_wakeup_error_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ip_hdr_err: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ip_payload_err: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ip_csum_bypassed: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ipv4_pkt_rcvd: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ipv6_pkt_rcvd: 64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 no_ptp_rx_msg_type_ext: 64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ptp_rx_msg_type_sync: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ptp_rx_msg_type_follow_up: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ptp_rx_msg_type_delay_req: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ptp_rx_msg_type_delay_resp: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ptp_rx_msg_type_pdelay_req: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ptp_rx_msg_type_pdelay_resp: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ptp_rx_msg_type_pdelay_follow_up: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ptp_rx_msg_type_announce: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ptp_rx_msg_type_management: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ptp_rx_msg_pkt_reserved_type: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ptp_frame_type: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ptp_ver: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 timestamp_dropped: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 av_pkt_rcvd: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 av_tagged_pkt_rcvd: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 vlan_tag_priority_val: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 l3_filter_match: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 l4_filter_match: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 l3_l4_filter_no_match: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 irq_pcs_ane_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 irq_pcs_link_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 irq_rgmii_n: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_tx_status_fifo_full: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_tx_fifo_not_empty: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmtl_fifo_ctrl: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_tx_fifo_read_ctrl_write: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_tx_fifo_read_ctrl_wait: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_tx_fifo_read_ctrl_read: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_tx_fifo_read_ctrl_idle: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mac_tx_in_pause: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mac_tx_frame_ctrl_xfer: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mac_tx_frame_ctrl_idle: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mac_tx_frame_ctrl_wait: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mac_tx_frame_ctrl_pause: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mac_gmii_tx_proto_engine: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_rx_fifo_fill_level_full: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_rx_fifo_fill_above_thresh: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_rx_fifo_fill_below_thresh: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_rx_fifo_fill_level_empty: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_rx_fifo_read_ctrl_flush: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_rx_fifo_read_ctrl_read_data: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_rx_fifo_read_ctrl_status: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_rx_fifo_read_ctrl_idle: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_rx_fifo_ctrl_active: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mac_rx_frame_ctrl_fifo: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mac_gmii_rx_proto_engine: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_tso_frames: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx_tso_nfrags: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_est_cgce: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_est_hlbs: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_est_hlbf: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_est_btre: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mtl_est_btrlm: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 q0_tx_pkt_n: 100<br>
&gt;=C2=A0 =C2=A0 =C2=A0 q0_tx_irq_n: 4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 q0_rx_pkt_n: 64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 q0_rx_irq_n: 58<br>
<br>
What useful information does this list of statistics bring in the<br>
commit message?<br>
<br></blockquote><div>Each output line of &quot;ethtool -S&quot; is from th=
e modified code: It shows the command still yields normal output results as=
 expected.<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!stmmac_safety_feat_dump(priv,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;priv-&gt;sstats, i=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &amp;desc)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(p, de=
sc, ETH_GSTRING_LEN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strscpy(p, d=
esc, ETH_GSTRING_LEN);<br>
<br>
Did you consider ethtool_puts() ?</blockquote><div>No, since strscpy=C2=A0d=
oes the job already. Also I could not find ethtool_puts: where is it define=
d? Or do you mean ethtool_put_stat, which is inappropriate to use here sinc=
e it requires a skb parameter?=C2=A0<br><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
=C2=A0 =C2=A0 Andrew<br>
<br>
---<br>
pw-bot: cr<br></blockquote><div><br><font color=3D"#555555"><span>Hi Andrew=
, Thanks for reviewing, please see inline.<br><br></span></font></div><div>=
Ray=C2=A0</div></div></div>

--000000000000baae0d060aaf67b3--

--===============0923739798731714706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0923739798731714706==--
