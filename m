Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AC196C2AF
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 17:42:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF99FC78011;
	Wed,  4 Sep 2024 15:42:37 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 165AFC78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 15:42:31 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a866966ffceso34149966b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 08:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725464550; x=1726069350;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=M6e2YvfuCivW4PaDMInxNwbpYH1/P7j1Q84PnG6YUUM=;
 b=LjEEis7gDB06QzILZMoCBpt/Itc7Ky2svplvndYDQ2AQOobBsCX9jEc1t4jjMqGDwF
 2o62ei0/ueuhd0KbEIfT9P8bCTJMyFgFvMw/jT4utehbqLs+8oFWLaA5mK+F4zOxca4G
 YCYEdgNTfRyHH5wu/wWzSYQV2V6sT9CRWQdn654Ds1+zaj7rK6lTbV14xcCVOxTjrJU0
 rfxpIAirRfcnbPhIIaNFezUnoUxMFqZi3H4317nTu8002odJDHwuR2EScB2A61kRbsd8
 0NBvxKlEVmOwwZaTQTRfkvMkgLnQrBWKZjEiWngXTUldvxD2jQ/tEUJPKgL1ZRX1SHn5
 PRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725464550; x=1726069350;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M6e2YvfuCivW4PaDMInxNwbpYH1/P7j1Q84PnG6YUUM=;
 b=DdJmDyj37SX1Cjf4LsF6RcpsDCdEb8TRhfMwt7BRonBXS5FvUJ4YkROeIqcMsbaOie
 oxM+psT2aoP1tIN8UvdZPaBwyTfQo8SWm9VXdmaRZehxCAbA/3LbUoNWkNsNePLz8CjW
 QztYq+DoyvaItQMyGH+ytCrwXBUhRW1FU0exCI/SkpZEcAWv1E8ABeCMXL68soNXXQYt
 gQ1ww3B0THlpnA8hflo8FXK0ZveWO4XFt0N8In0fALxM/CKziNyzxOUDudeKmbR2TwMh
 /Wl3QSM47L4264+MsCLe+go5xuFPUImnKkRHsDAg2pTInH0gHdALdHy3broZlj+4OqsB
 agpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9cDcS91SVloukWXQvp8d1467Yoya86OPsnFZBEpAwRknYR33BrrVTYvgpC1bYuAxqBFS/5vQwws2g0Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxl88VJ0V4SidgqJa6anrskQFkxT3rfJKlq6bzGBz//absVD9gG
 qWqf5AlfqlWblYB9Tj2/2q9eKiOl0YOtUp1I19ukdbAE/eLoGnbz
X-Google-Smtp-Source: AGHT+IHMic4XBuw2foanj88RblIDJ3ytZUAtd4gGVvzDtDWkXLLbXdQlWIpM8/kI4V1eZSw3Ww7rJQ==
X-Received: by 2002:a17:907:7b94:b0:a7a:87b3:722f with SMTP id
 a640c23a62f3a-a89a34c8c79mr775057766b.3.1725464549704; 
 Wed, 04 Sep 2024 08:42:29 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a62038d59sm7125066b.52.2024.09.04.08.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 08:42:29 -0700 (PDT)
Date: Wed, 4 Sep 2024 18:42:26 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240904154226.ztksb6sv4mjccb5l@skbuf>
References: <cover.1725441317.git.0x1207@gmail.com>
 <cover.1725441317.git.0x1207@gmail.com>
 <28f580d1c1e3cfdb0803207a5e05d42c4f9dd529.1725441317.git.0x1207@gmail.com>
 <28f580d1c1e3cfdb0803207a5e05d42c4f9dd529.1725441317.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28f580d1c1e3cfdb0803207a5e05d42c4f9dd529.1725441317.git.0x1207@gmail.com>
 <28f580d1c1e3cfdb0803207a5e05d42c4f9dd529.1725441317.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 rmk+kernel@armlinux.org.uk, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 5/7] net: stmmac: support fp
 parameter of tc-mqprio
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Sep 04, 2024 at 05:21:20PM +0800, Furong Xu wrote:
> +static void stmmac_reset_tc_mqprio(struct net_device *ndev,
> +				   struct netlink_ext_ack *extack)
> +{
> +	struct stmmac_priv *priv =3D netdev_priv(ndev);
> +
> +	netdev_reset_tc(ndev);
> +	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
> +	stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
> +}
> +
> +static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
> +				    struct tc_mqprio_qopt_offload *mqprio)
> +{
> +	struct netlink_ext_ack *extack =3D mqprio->extack;
> +	struct tc_mqprio_qopt *qopt =3D &mqprio->qopt;
> +	u32 offset, count, num_stack_tx_queues =3D 0;
> +	struct net_device *ndev =3D priv->dev;
> +	u32 num_tc =3D qopt->num_tc;
> +	int err;
> +
> +	if (!num_tc) {
> +		stmmac_reset_tc_mqprio(ndev, extack);
> +		return 0;
> +	}
> +
> +	err =3D netdev_set_num_tc(ndev, num_tc);
> +	if (err)
> +		return err;
> +
> +	for (u32 tc =3D 0; tc < num_tc; tc++) {
> +		offset =3D qopt->offset[tc];
> +		count =3D qopt->count[tc];
> +		num_stack_tx_queues +=3D count;
> +
> +		err =3D netdev_set_tc_queue(ndev, tc, count, offset);
> +		if (err)
> +			goto err_reset_tc;
> +	}
> +
> +	err =3D netif_set_real_num_tx_queues(ndev, num_stack_tx_queues);
> +	if (err)
> +		goto err_reset_tc;
> +
> +	err =3D stmmac_fpe_map_preemption_class(priv, ndev, extack,
> +					      mqprio->preemptible_tcs);
> +	if (err)
> +		goto err_reset_tc;

I appreciate the improvement with the separate tc_ops, but I'm still not
in love with this.

This stmmac_hw entry (copied with line numbers because it lacks a name
by which I can easily reference it):

159 =BB       }, {
160 =BB       =BB       .gmac =3D false,
161 =BB       =BB       .gmac4 =3D true,
162 =BB       =BB       .xgmac =3D false,
163 =BB       =BB       .min_id =3D 0,
164 =BB       =BB       .regs =3D {
165 =BB       =BB       =BB       .ptp_off =3D PTP_GMAC4_OFFSET,
166 =BB       =BB       =BB       .mmc_off =3D MMC_GMAC4_OFFSET,
167 =BB       =BB       =BB       .est_off =3D EST_GMAC4_OFFSET,
168 =BB       =BB       },
169 =BB       =BB       .desc =3D &dwmac4_desc_ops,
170 =BB       =BB       .dma =3D &dwmac4_dma_ops,
171 =BB       =BB       .mac =3D &dwmac4_ops,
172 =BB       =BB       .hwtimestamp =3D &stmmac_ptp,
173 =BB       =BB       .mode =3D NULL,
174 =BB       =BB       .tc =3D &dwmac510_tc_ops,
175 =BB       =BB       .mmc =3D &dwmac_mmc_ops,
176 =BB       =BB       .est =3D &dwmac510_est_ops,
177 =BB       =BB       .setup =3D dwmac4_setup,
178 =BB       =BB       .quirks =3D stmmac_dwmac4_quirks,
179 =BB       }, {

has .mac =3D &dwmac4_ops, so it does not implement .fpe_map_preemption_clas=
s().
But it also has .tc =3D &dwmac510_tc_ops, so tc_setup_dwmac510_mqprio() will
get called.

Thus, I suppose that the stmmac_fpe_map_preemption_class() ->
stmmac_do_void_callback() mechanism will return -EINVAL for dwmac4_ops,
and this will make mqprio offload fail, for the sole reason that FPE is
not supported, _EVEN IF_ FPE was never requested (mqprio->preemptible_tcs i=
s 0),
and the offload could have otherwise been applied just fine.

Not to mention my previous complaint still applies, that the test for
the presence of stmmac_ops :: fpe_map_preemption_class() is unnaturally
late relative to the flow of the tc_setup_dwmac510_mqprio() function.

Thus, I really recommend you to replace the stmmac_do_void_callback()
anti-pattern with something like:

	// early
	if (mqprio->preemptible_tcs && !priv->hw->ops->fpe_map_preemption_class) {
		NL_SET_ERR_MSG_MOD(mqprio->extack,
				   "Cannot map preemptible TCs to TXQs");
		return -EOPNOTSUPP;
	}

	// late
	if (priv->hw->ops->fpe_map_preemption_class) {
		err =3D priv->hw->ops->fpe_map_preemption_class(priv->dev,
							      mqprio->preemptible_tcs,
							      extack);
		if (err)
			goto err_reset_tc;
	}

WARNING: code not tested. The idea is that the early check makes sure
that only dwmac410_ops and dwmac510_ops permit mqprio->preemptible_tcs
to go to a non-zero value (which can later be reset to zero if desired,
in the late code path). For dwmac4_ops, mqprio->preemptible_tcs =3D 0 is
the only supported value (for which nothing needs to be done), and the
late code path is bypassed, due to the "if" condition returning false.

Either organize like this, or if you really, really, really insist to
use the stmmac_do_callback() anti-pattern in new code, at least don't
share the setup_mqprio() code path between MACs that implement
fpe_map_preemption_class() and MACs that don't.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
