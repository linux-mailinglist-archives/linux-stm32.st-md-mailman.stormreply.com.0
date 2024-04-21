Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E438ABF7D
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Apr 2024 16:07:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88757C6DD67;
	Sun, 21 Apr 2024 14:07:45 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EA2DC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 14:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1713708433; x=1714313233; i=markus.elfring@web.de;
 bh=rGFEHaSAYJNx3UiIUNYR80pXYXBmvUUDb2g2ErCYGyU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tQYCgFiDBtzuJtaPSJ86VUUlnx3bXoxnIn1J0YHGl7VF+oYJVzcRSwD+G2zZBzgc
 uTB8dvnwWkDivQsAUzxLsiwv5flkheBVFHvsQiOfznxtj7fLZB3M8RFbR5o6aFner
 Sj1t1PzkywvlBvwKXs4Lr6JhavodozKnL0Svdq+lChYVhVirwNbPz6tS+gVYWlXqa
 95mVIMsrQSmRFKT9TUNwZGTilthpjTn79LrHyCd7LFaP6wfUdMG/3T6vJ4rOdi4dH
 iwGmCcl6aPaM0eI/pxYxleUmRrN9tSkK8x+A6S2Z4uZFiufNUmPWXhufwg8tihQys
 I2EGKqoXEcArn2eUPQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIL0Q-1rt3fo3mEe-00EaEg; Sun, 21
 Apr 2024 16:07:13 +0200
Message-ID: <8da94316-239a-4870-a29d-02a685ac9ae5@web.de>
Date: Sun, 21 Apr 2024 16:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abylay Ospan <aospan@netup.ru>, Alain Volmat <alain.volmat@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, Sergey Kozlov <serjk@netup.ru>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
References: <20240419-fix-cocci-v2-26-2119e692309c@chromium.org>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240419-fix-cocci-v2-26-2119e692309c@chromium.org>
X-Provags-ID: V03:K1:ITKldMmeWvicPfSwk1lGM7Lql2Cm3DyJ9It4EIHpN6gg859l9MR
 aVD74QMk+LR7UI7fCic1Ij6uvX8fwvnr7wmvQM8i2QbG3+d/JBqLNeRM3I4bZa4E34XPC0i
 SYsbUCsj7/cRMEyPRu6MKnSrI42n3gk8CvyH//Tym6kHgNuHGbXy4egSum6bjeRch61q+dN
 e/VFoFn+HOp3S2jycBj4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aX93InMPE+A=;h+M1UNdgZoIAePk/gLkMPUcnWFE
 5gaoXXP6v2pwlnxGO6K7et1oLiL8TIAKeJnHv51y9QwquJqybP572QDhkhzEsuPTkoIRzUN/7
 mShPYDLUIN00VsLwJwEmnundkTslk9hH7wxBTGzqOXKZ5TY5ODDTJuvlXRSs6Qt0j6Z/P7XXu
 15PpEI3BzQ9oSDuGd4BeLDWBmnFddw2ZuXCPSrm3HnBRmIp4rcHTseicBP7mUCsPTUTDT+3Y+
 vWHqY5jFyqwmk7ss25eqM/46T0rHpKxI0nKyahCwXvP7DUiZ1GPEITM3E7kQt4ALfzBy8uKQ3
 /QbGwtOhCqs5WJIPQAZqJR6XUwVGf7oZKojimwo3AaT5UA3U1JOPBrIBsYOKM154eq6cLRhb7
 iq3PcpnWcp3XY2aFQX8MCVRIVXgd8lxxQdtn8YCerRLUuZvtUlbR4R5j/YvI2UKy7FgzUXB1x
 3Bhlx0CwbqmbGIefOVLAyR4cfc+nIFs51pRtQ8+ewYveJRDBdeXtJMHFEz0n4phTP8RtZsl/0
 gBuiCYpYSSRcLDJIy3sB4G28Z9bjW/ocQDIUzqRvU2jwtnKM/PbNp1oZAjsy9Ua/wqTwFL3Yy
 D08zYttD1lPwxETSj/WDnXQ3ihq22+OycigTle4pH0Fu9sjflBCpMtE0wevQzd9/RPzz87VXO
 1UKjbmrDXvCF8Uxa9dvN/3c2y+mOW1EZ9w+T50Rgk7lXX021VRrmvb28kFBahImqiPOj/VuzQ
 kgKYpxl/BMOIFE87FcD1inozha/zbBUBsau+PpHyJL+sc7SUX97HhHV18g4SNex2a01C1nw4y
 muG/WBbFF6tZ2iO9s0OozwYOGKNkAjvz3gnxDEJWMz9DY=
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 26/26] media: dvb-frontends: tda10048:
 Make explicit the range of z.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

PiBXZSBkbyBub3QgZXhwZWN0IHRoZSBzYW1wbGVfZnJlcSB0byBiZSBvdmVyIDYxM01Iei4KCldv
dWxkIHRoZSBzdW1tYXJ5IHBocmFzZSDigJxNYWtlIHRoZSByYW5nZSBvZiB6IGV4cGxpY2l04oCd
IGJlIG1vcmUgYXBwcm9wcmlhdGU/CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
