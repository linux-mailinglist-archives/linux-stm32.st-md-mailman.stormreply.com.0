Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49493CB03B6
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Dec 2025 15:17:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9660EC5F1FB;
	Tue,  9 Dec 2025 14:17:39 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB506C5F1D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Dec 2025 14:17:37 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2a484a0b7cfso7230275eec.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Dec 2025 06:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765289856; x=1765894656;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=;
 b=iLMQPVVTilvEloU+WdQ8sukYlZDzmozlxVVoVimCzk7Rt053GgNfooisOm40vFaybo
 5NtKym1oqh4Nf4t0Lj1uvewff1npo9Xg8CGQ+FaimQ/VEU+az9jhsyXVOH2ppTNzulIs
 g0Bxqha/9B6wyHD4EK4vaFfJysVH5c77zm/sz88Agg47WgA0GcAueEt7kcivoG/pm3j/
 TYxdiVKOt5AGkgwUHHumsKem2+BnjcMay1PNrgUMcjlCWOgG2jexXdktQ7E/R1S4W74w
 hfPc8mUSlCjTKUMeZiSQrcg20ZYjhxipfwBMb8qEpjoV5wwUTavU85mFdZVLJX5ZysBm
 +0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765289856; x=1765894656;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=;
 b=ZKPjMS4B13JyIuWXarszGaRfv9SylWlfuLcfWaOjq+GKRWqR8xQC3ym1kD/wKLav4N
 sJxXdKMYcfq4wOOVUc1X+CqYN5xpDcLMsHlaJ/QhZAsec2H/4vG2cKQzDq3CCUtO3/Mo
 sEcBcNfCmVOTk4CERaIA7Cn2LMG59xIRO9Fl2drhIX0InJ1fjfm5dHMxYXUoAbEh4YOK
 2eRSfb/8Vpm8GuNp/pPpp/oawGzi5dgRtodxg5vlZHXr74ixv49ly6r9rwh41eG+IpU2
 Ad6WFIu8B6bCFQzu2nL4mIMVoPqpzOFFi8SLH6yjrdL4xkP+Dutd3cgDSt983YzlNMdH
 /DaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUedB6YApKKXeNY4zzYxDsYZ0a50yP1Cu7xfbOZOgBiijftFAnxFcFUy1I71//mM+zdKS2lTio0uyU7g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywi8i8igEe7HvbqtKxi4NTwLcXsT7VQLq58A8HXshKEYbHuQFsN
 eqtkz+6rdPvYpOKkT4/4YN8wq9CnLqkW81cCx6sEtQcnLL5OE7Zd4RwRP/jU02o6b9Lxr9XCamE
 xMwsEhxjB2/zqQeHPUN32MJgjViLiVqw=
X-Gm-Gg: AY/fxX4MF4gytEJaAkFdUrfXdo95O+NhmExbryedShCocst4pZQq3sOSssa+0Q2u4h2
 uNONc0kABUCPnSosMxvJTaGNsa1OFjKAYZ9m1g6Wfo/H/+Tqsln1PYrDs6vZlMbaraSMuyW41Iw
 inpXqeeNB6C6QbAmUX7b6xIMl0lNeZb2MWU/097w9EabyqbwR+xp0hYR/N0ZB/9omavzERFjlRo
 +gQPvARCIVmqWMsBtWGbhIcMXZ2u9n75YfRO5SET+EAnsOTf1fTN4jZDMkqfW0K4GjXTfEAHO1n
 EGD3hSoqsVCf3D8FiZZuX6F0Ry2HtOgkDd8pDnkfkQrQ03lLwAwxKplMrDLCMmIp442aCJHLqLQ
 f43FMSa4Rvg==
X-Google-Smtp-Source: AGHT+IHJSK7Qp1zb5om02W592OqiY5udTEsk9nBSftpZyGmqI0e9P/OjwE7rDiAyfrBX382yq5jBhBWzuWKkJmGaXh4=
X-Received: by 2002:a05:7301:f25:b0:2a4:50c2:a74c with SMTP id
 5a478bee46e88-2abf8dee655mr691583eec.8.1765289856143; Tue, 09 Dec 2025
 06:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20251124182751.507624-1-robh@kernel.org>
 <CGME20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c@eucas1p1.samsung.com>
 <20251124182751.507624-2-robh@kernel.org>
 <674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
 <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
In-Reply-To: <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:20:03 +0200
X-Gm-Features: AQt7F2rjwQKc_bRBeYsxUFhD_YJR9U-Y3qN6s4VMgPax1Na8ykfHoapTIdM-w18
Message-ID: <CAEnQRZDBZ52FoNRBJa1qScbkcEYKwbyP_ephutdkYFaY5b1yLw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-remoteproc@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Beleswar Padhi <b-padhi@ti.com>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v7 2/2] remoteproc: qcom: Use
 of_reserved_mem_region_* functions for "memory-region"
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

> Other platforms (non-QCom) were tested also use
> devm_ioremap_resource_wc(). So something else is claiming the same
> region? Can you dump out /proc/iomem?
>
> The region is dynamically allocated, so maybe that has something to do with it.

We noticed a related issue with imx_dsp_rproc.

Because:
imx_dsp_rproc_prepare:
 -> imx_dsp_rproc_add_carveout
     -> /*... */ and this calls devm_ioremap_resource_wc
-> pm_runtime_get_sync

imx_dsp_rproc_unprepare:
 ->pm_runtime_put_sync

There is no easy way to manually undo devm_ioremap_resource_wc so I have
sent a patch to use devm_ioremap_wc.

https://lore.kernel.org/imx/20251209140425.766742-1-daniel.baluta@nxp.com/T/#u

In your case Marek at least you need to understand which driver
reserves    8dc00000-8e7fffff : reserved and why.

thanks,
Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
