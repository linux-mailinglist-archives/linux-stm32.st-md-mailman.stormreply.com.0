Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E93457AEBA7
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Sep 2023 13:43:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB7C4C6B462;
	Tue, 26 Sep 2023 11:43:24 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 572FEC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 11:43:23 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2c123eed8b2so142870371fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 04:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695728602; x=1696333402;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G4Jo6O14HRB1lG6y0fYE66EjY1Mf0lwNVNRvWwmPG5M=;
 b=L24sTmQidwyf8w0t/2tsQUciqovZxMUZ1pAXEWQ5vfzUVGFmmpxoJs8uDVoL0QCipc
 fyZF1JYGnv+tinh7A88Uh3ZPgk+W8cIs/cay47kS7OmRNujTjoHtRIY/TgAOkfNTJ5fU
 XYCbr24nMCEI6XkXh7u12ZDAh+ww4TvxxXMx/3cXeR1Dddgeom9/5O7PMItJ3Gs5HTnR
 XLseQcOwrOiZ58mG4snUzsU0l9QNqI7nXP/pMbxVUqzDK3rIryy9bDRkKVM5l7jkrurc
 Us6DfnmxxGv4y2YV+rjJFkiLr72tXkM19yFup82Y/MeSPI1IHBYtC9a53AX8ZK5uRZoX
 e1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695728602; x=1696333402;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G4Jo6O14HRB1lG6y0fYE66EjY1Mf0lwNVNRvWwmPG5M=;
 b=XcPPm+nPoayDfzkIcG4iNLX7hHbC3Z1YdBeWe/w88m/N2VMn7wukEE/F5qDENwRYln
 X8b6btU9bU0Jrb1fDmv04Qs7+geZpnEzkGKGh4l1Lr13/xXrVJ+Rsr2/Im7Z0VuK9Zct
 81Rj8ijZ5yuNK9RCG9jTSUQs/iAciHgDdcxkUg82QwpouBnCcYLtIZZ5brpmQnPiDIL6
 2UxZoWRa4xAWzoqSfI9H9YwX6AHti7XL+bNf96bVLLf2slHCkxYKTbscJ479+YMJdT4J
 X9geqU7FATmyoehuqn0BC1COorZG/uAEeeZ/yFef1RYGrll3VWb5hvCY8OwriEkFo30O
 Pf9Q==
X-Gm-Message-State: AOJu0Yz79EyBJjMVIisTt48PuXeVVvb4EMnjQ6r5LKpY5SMkI7q5X8mo
 /oE/C2VNj+favnSu3RRijp0=
X-Google-Smtp-Source: AGHT+IH/MS17QN8xe+m37vMDEV0uLfGOO0lTQnOrpBtUvOIUyGxxmjrwjFZUXHSzbrEjc3LbupuBfw==
X-Received: by 2002:a05:6512:2025:b0:503:1d46:6f29 with SMTP id
 s5-20020a056512202500b005031d466f29mr8151639lfs.37.1695728602373; 
 Tue, 26 Sep 2023 04:43:22 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056512040200b004fb78959218sm2197277lfk.200.2023.09.26.04.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 04:43:21 -0700 (PDT)
Date: Tue, 26 Sep 2023 14:43:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Message-ID: <mq4q2ku5ephuk7gd4wmh65qqgxawvlb5dncdedyzeifphi3zdq@pk4g7tj5jhpl>
References: <20230921062443.1251292-1-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921062443.1251292-1-xiaoning.wang@nxp.com>
Cc: linux-kernel@vger.kernel.org, bartosz.golaszewski@linaro.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: platform: fix the
	incorrect parameter
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Sep 21, 2023 at 02:24:43PM +0800, Clark Wang wrote:
> The second parameter of stmmac_pltfr_init() needs the pointer of
> "struct plat_stmmacenet_data". So, correct the parameter typo when calling the
> function.

Right. Thanks for fixing this.
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> Otherwise, it may cause this alignment exception when doing suspend/resume.
> [   49.067201] CPU1 is up
> [   49.135258] Internal error: SP/PC alignment exception: 000000008a000000 [#1] PREEMPT SMP
> [   49.143346] Modules linked in: soc_imx9 crct10dif_ce polyval_ce nvmem_imx_ocotp_fsb_s400 polyval_generic layerscape_edac_mod snd_soc_fsl_asoc_card snd_soc_imx_audmux snd_soc_imx_card snd_soc_wm8962 el_enclave snd_soc_fsl_micfil rtc_pcf2127 rtc_pcf2131 flexcan can_dev snd_soc_fsl_xcvr snd_soc_fsl_sai imx8_media_dev(C) snd_soc_fsl_utils fuse
> [   49.173393] CPU: 0 PID: 565 Comm: sh Tainted: G         C         6.5.0-rc4-next-20230804-05047-g5781a6249dae #677
> [   49.183721] Hardware name: NXP i.MX93 11X11 EVK board (DT)
> [   49.189190] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   49.196140] pc : 0x80800052
> [   49.198931] lr : stmmac_pltfr_resume+0x34/0x50
> [   49.203368] sp : ffff800082f8bab0
> [   49.206670] x29: ffff800082f8bab0 x28: ffff0000047d0ec0 x27: ffff80008186c170
> [   49.213794] x26: 0000000b5e4ff1ba x25: ffff800081e5fa74 x24: 0000000000000010
> [   49.220918] x23: ffff800081fe0000 x22: 0000000000000000 x21: 0000000000000000
> [   49.228042] x20: ffff0000001b4010 x19: ffff0000001b4010 x18: 0000000000000006
> [   49.235166] x17: ffff7ffffe007000 x16: ffff800080000000 x15: 0000000000000000
> [   49.242290] x14: 00000000000000fc x13: 0000000000000000 x12: 0000000000000000
> [   49.249414] x11: 0000000000000001 x10: 0000000000000a60 x9 : ffff800082f8b8c0
> [   49.256538] x8 : 0000000000000008 x7 : 0000000000000001 x6 : 000000005f54a200
> [   49.263662] x5 : 0000000001000000 x4 : ffff800081b93680 x3 : ffff800081519be0
> [   49.270786] x2 : 0000000080800052 x1 : 0000000000000000 x0 : ffff0000001b4000
> [   49.277911] Call trace:
> [   49.280346]  0x80800052
> [   49.282781]  platform_pm_resume+0x2c/0x68
> [   49.286785]  dpm_run_callback.constprop.0+0x74/0x134
> [   49.291742]  device_resume+0x88/0x194
> [   49.295391]  dpm_resume+0x10c/0x230
> [   49.298866]  dpm_resume_end+0x18/0x30
> [   49.302515]  suspend_devices_and_enter+0x2b8/0x624
> [   49.307299]  pm_suspend+0x1fc/0x348
> [   49.310774]  state_store+0x80/0x104
> [   49.314258]  kobj_attr_store+0x18/0x2c
> [   49.318002]  sysfs_kf_write+0x44/0x54
> [   49.321659]  kernfs_fop_write_iter+0x120/0x1ec
> [   49.326088]  vfs_write+0x1bc/0x300
> [   49.329485]  ksys_write+0x70/0x104
> [   49.332874]  __arm64_sys_write+0x1c/0x28
> [   49.336783]  invoke_syscall+0x48/0x114
> [   49.340527]  el0_svc_common.constprop.0+0xc4/0xe4
> [   49.345224]  do_el0_svc+0x38/0x98
> [   49.348526]  el0_svc+0x2c/0x84
> [   49.351568]  el0t_64_sync_handler+0x100/0x12c
> [   49.355910]  el0t_64_sync+0x190/0x194
> [   49.359567] Code: ???????? ???????? ???????? ???????? (????????)
> [   49.365644] ---[ end trace 0000000000000000 ]---
> 
> Fixes: 97117eb51ec8 ("net: stmmac: platform: provide stmmac_pltfr_init()")
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 0d9b2138b60a..3c6fd9027934 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -900,7 +900,7 @@ static int __maybe_unused stmmac_pltfr_resume(struct device *dev)
>  	struct platform_device *pdev = to_platform_device(dev);
>  	int ret;
>  
> -	ret = stmmac_pltfr_init(pdev, priv->plat->bsp_priv);
> +	ret = stmmac_pltfr_init(pdev, priv->plat);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
