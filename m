Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3671B4EF23E
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Apr 2022 17:11:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCE79C5EC6B;
	Fri,  1 Apr 2022 15:11:06 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F345CC5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Apr 2022 15:11:04 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 10C1E3201FCD;
 Fri,  1 Apr 2022 11:11:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 01 Apr 2022 11:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=85vYE7geyFacYR8Bxp5rx99f4lvCAgcFm8Mv3d
 x7Et0=; b=uqN93OsRY4pv8Qlr/shSQR72EtAJvueZ4TOqtxSPxzqVAPgyt85kgc
 cpMk5Lr8S1rzv2WZwkk3w2+5YNXaJJVfFw/Z+g6H0TTQC0S+SfnN1f1weInrqNn1
 KEFnLK1tcldUUraA3PQwMEtGkjGb7wzO1VfyArh/PrMIVe173PfI5PTfr5VR1m65
 IXRDtfnn9VU7v2+08pjeE2yZVs53uErgnIxWwQT3souvEkpongoI6yWYKgUnW8at
 Of5GBu4yewyL3p+ObxO3PlovJ61Fn5IJpaKZeF5ZAxHYn7E6AVppyvn4qex72eQo
 1fDd/bToXqZfaIngYJNGTvUNdQ9Pez0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=85vYE7geyFacYR8Bx
 p5rx99f4lvCAgcFm8Mv3dx7Et0=; b=YzOT3Ye3jL23wTFhiPMZJJ7XWXtE5Si61
 9RgwF0BkNxIEmWBbxNzStCCcf/1J4JBs/VdstTG86BtsK3sbtQdop5eDQHNc9TVE
 zyWBe3I4cxJ6fRuKvcyRUVc1SbUYBabsI4wCpkV5lkg3I6qqqV5oZ6csy1B5L6D3
 px3EAXXZVY+YdzdSuuy//l9zQQf3hzbbKqFkeV3fzyP9YkBaksjtAcvMtdmpV54I
 Lbo2sso+eyfTh4wLmORkqKzyXxqDMKS1qsRRKfdVfIorUKGJ7TfczSThkOzkftLK
 M0HuO8F/DggXrRRU/epXiT5/drz11Y5IfPVM9Q5iCKdThC1V4QjeQ==
X-ME-Sender: <xms:BBZHYtDBn6wWaMWqZOdMlkJeiLCpB-RBe39EhkuR0RF6lfII6025Pw>
 <xme:BBZHYriB3FsZBzKU3s1yEkr62J4qyvjJ5i0P6ehGAeYYG6WB7HKnTMrla4R2IEOcx
 U9W9-xtm6EKMHiXxg4>
X-ME-Received: <xmr:BBZHYonjblZ8br7N4xFtMF40JIsY1NXrzpUASr_srJhdj0t1hRQFasXFe8X-NY5pVxyLpf_tR_nz0E5tmgaEoDPYhEe1oHuNKULSm2o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepffdujefgtefhudelleekffegteejueduudekveffteeuvdehgeefffeutdff
 jeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpthhugigsuhhilhgurdgtohhmpd
 hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BBZHYnxj00KQNhZOIa2UXOPFEHTYLF9SwXltBLj1a3tul2GjE4Wvxw>
 <xmx:BBZHYiSI9tnfJfHxZsHMUbH2872XFVhQMZbjpqtfrbdARI9T3yfabA>
 <xmx:BBZHYqbrXoaCOUK4Bre_ME6PlieSVBTevTYlH3UTsWNkYpggbAYzhA>
 <xmx:BRZHYnjAd0ulsaL8ThUtEh1UENCL3aCitf3l9-dmJQ_fh062608-dg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 11:11:00 -0400 (EDT)
Date: Fri, 1 Apr 2022 17:10:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20220401151058.fipdax3kvmxknctv@houat>
References: <CA+G9fYuqU45hHmK4WMUNEXQbmBucE+9fB=S9wcHEfEHaZ2jgcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+G9fYuqU45hHmK4WMUNEXQbmBucE+9fB=S9wcHEfEHaZ2jgcQ@mail.gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, regressions@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, gabriel.fernandez@foss.st.com,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [next] db845c: WARNING: CPU: 5 PID: 8 at
 drivers/clk/clk-divider.c:139 divider_recalc_rate
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
Content-Type: multipart/mixed; boundary="===============4516626155813657101=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4516626155813657101==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="25docxotcljt756a"
Content-Disposition: inline


--25docxotcljt756a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 31, 2022 at 05:33:57PM +0530, Naresh Kamboju wrote:
> Following kernel warning noticed on db845c while booting linux next-20220=
331.
>=20
> metadata:
>   git_ref: master
>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git_sha: fdcbcd1348f4ef713668bae1b0fa9774e1811205
>   git_describe: next-20220331
>   kernel_version: 5.17.0
>   kernel-config: https://builds.tuxbuild.com/278RLnhgJL7XdlJbcbv07jiwbYB/=
config
>=20
> Boot log:
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x517f803c]
> [    0.000000] Linux version 5.17.0-next-20220331 (tuxmake@tuxmake)
> (aarch64-linux-gnu-gcc (Debian 11.2.0-18) 11.2.0, GNU ld (GNU Binutils
> for Debian) 2.38) #1 SMP PREEMPT @1648699852
> [    0.000000] Machine model: Thundercomm Dragonboard 845c
> <trim>
> [    8.131366] ------------[ cut here ]------------
> [    8.131374] dsi0_pll_bit_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO =
not set
> [    8.131387] WARNING: CPU: 5 PID: 8 at drivers/clk/clk-divider.c:139
> divider_recalc_rate+0x8c/0xc0
> [    8.131398] Modules linked in: qcom_spmi_adc5 snd_soc_sdm845
> qcom_vadc_common qcom_spmi_temp_alarm qcom_pon crct10dif_ce rtc_pm8xxx
> snd_soc_rt5663 msm snd_soc_qcom_common gpu_sched snd_soc_rl6231
> soundwire_bus reset_qcom_pdc drm_dp_helper qcom_camss hci_uart
> videobuf2_dma_sg btqca v4l2_fwnode venus_core ath10k_snoc v4l2_async
> btbcm ath10k_core i2c_qcom_geni v4l2_mem2mem videobuf2_memops
> videobuf2_v4l2 ath bluetooth camcc_sdm845 videobuf2_common
> spi_geni_qcom i2c_qcom_cci qcom_rng mac80211 xhci_pci qcom_q6v5_mss
> xhci_pci_renesas cfg80211 icc_osm_l3 slim_qcom_ngd_ctrl qcom_wdt
> rfkill qrtr lmh pdr_interface display_connector slimbus qcom_q6v5_pas
> drm_kms_helper qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common
> qcom_glink_smem qmi_helpers drm mdt_loader socinfo rmtfs_mem fuse
> [    8.131462] CPU: 5 PID: 8 Comm: kworker/u16:0 Not tainted
> 5.17.0-next-20220331 #1
> [    8.131465] Hardware name: Thundercomm Dragonboard 845c (DT)
> [    8.131467] Workqueue: events_unbound deferred_probe_work_func
> [    8.131475] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    8.131477] pc : divider_recalc_rate+0x8c/0xc0
> [    8.131479] lr : divider_recalc_rate+0x8c/0xc0
> [    8.131481] sp : ffff8000080936c0
> [    8.131482] x29: ffff8000080936c0 x28: ffff781940e58d00 x27: ffffa7f3f=
1bc6d38
> [    8.131485] x26: ffffa7f3f1bc6cf8 x25: 0000000000000000 x24: fffffffff=
fffffff
> [    8.131488] x23: ffff781947e8a400 x22: 000000003b9aca50 x21: ffff78194=
0be0800
> [    8.131491] x20: ffff781947e8a800 x19: 000000003b9aca50 x18: 000000000=
0000000
> [    8.131494] x17: 0000000000000000 x16: 0000000000000000 x15: 000000000=
0000000
> [    8.131497] x14: ffff7819bd718000 x13: 0a74657320746f6e x12: 204f52455=
a5f574f
> [    8.131500] x11: 4c4c415f52454449 x10: 5649445f4b4c4320 x9 : ffffa7f3f=
011de84
> [    8.131502] x8 : 445f4b4c4320646e x7 : 6120726f73697669 x6 : 000000000=
0000001
> [    8.131505] x5 : ffffa7f3f288f000 x4 : ffffa7f3f288f2d0 x3 : 000000000=
0000000
> [    8.131508] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff78194=
02c7000
> [    8.131511] Call trace:
> [    8.131512]  divider_recalc_rate+0x8c/0xc0
> [    8.131513]  clk_divider_recalc_rate+0x64/0x90
> [    8.131515]  clk_recalc+0x40/0xb0
> [    8.131519]  clk_calc_subtree+0x58/0x90
> [    8.131521]  clk_calc_subtree+0x70/0x90
> [    8.131523]  clk_calc_new_rates+0x150/0x290
> [    8.131526]  clk_calc_new_rates+0x100/0x290
> [    8.131528]  clk_calc_new_rates+0x100/0x290
> [    8.131530]  clk_calc_new_rates+0x100/0x290
> [    8.131533]  clk_core_set_rate_nolock+0xa0/0x2a4
> [    8.131535]  clk_set_rate_range_nolock.part.0+0xbc/0x2a0
> [    8.131538]  __clk_put+0x70/0x140
> [    8.131540]  clk_put+0x1c/0x30
> [    8.131543]  of_clk_set_defaults+0x140/0x3c0
> [    8.131546]  platform_probe+0x48/0xf0
> [    8.131548]  really_probe+0x184/0x3d0
> [    8.131550]  __driver_probe_device+0x11c/0x190
> [    8.131553]  driver_probe_device+0x44/0xf4
> [    8.131556]  __device_attach_driver+0xa4/0x140
> [    8.131558]  bus_for_each_drv+0x84/0xe0
> [    8.131561]  __device_attach+0xe4/0x1c0
> [    8.131563]  device_initial_probe+0x20/0x30
> [    8.131565]  bus_probe_device+0xa4/0xb0
> [    8.131567]  deferred_probe_work_func+0xa8/0xfc
> [    8.131570]  process_one_work+0x1dc/0x450
> [    8.131575]  worker_thread+0x154/0x450
> [    8.131577]  kthread+0x100/0x110
> [    8.131579]  ret_from_fork+0x10/0x20
> [    8.131584] ---[ end trace 0000000000000000 ]---
> [    8.131588] ------------[ cut here ]------------

I'm not sure if it's feasible, but if it is, it looks like something
that could be fixed by the patch pasted here:

https://lore.kernel.org/linux-clk/20220401122736.5yvanksa4pla7uql@houat/

Could you test it?

Thanks!
Maxime

--25docxotcljt756a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkcWAgAKCRDj7w1vZxhR
xQhqAQD9TRfKP+yInwBbsA9UH7rk4a9uaL5qTy8IEhUfFGVMcgEA+j6eFXzx3DyM
UV7SUiD406ZMAkW0dK1UzfyTnNfYagE=
=U5oE
-----END PGP SIGNATURE-----

--25docxotcljt756a--

--===============4516626155813657101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4516626155813657101==--
