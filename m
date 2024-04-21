Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5D38ABF49
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Apr 2024 15:26:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06826C6DD67;
	Sun, 21 Apr 2024 13:26:01 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A9DCC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 13:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1713705934; x=1714310734; i=markus.elfring@web.de;
 bh=evdFeQD/L6zQL0Vd61pp1Z/7nDj1MNxAxQVGWpoT+5Q=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=VrMEtnc9KLC3MVNt+764ZSr+yQI43wvtrAxVexemR+a2TAlQU2e13mDeYYxxa41k
 eBxqAT4Q9PO7QwttE0oQozSSRa0rOfTL7FmSWudrmTzm3PqZFHCyRnNn2l2uKMDcU
 MjDU8myQE2eiYt0BCRDhkVqdmMyBFRienuQiUwRAsHvMD1My+eSbTEa+hTgry6y4T
 Ij8kIPM7cRc7mdocsUgID8hImuuqQeWz4fJQCcFrpNWujyze8CU4SXP7r0U8NxLbm
 eo0Kn9ZYoV9BSlI8C17rImOfH1pkK5oBEZ4PRGznRhR2q22Amz3aODSmAP5ETRTHz
 xBLNIAWtt7/GLoELSA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MftBr-1seBTb1bXF-00fyQd; Sun, 21
 Apr 2024 15:25:34 +0200
Message-ID: <0ab13de0-0fde-40e2-958f-6a0818911009@web.de>
Date: Sun, 21 Apr 2024 15:25:31 +0200
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
References: <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
X-Provags-ID: V03:K1:f+xcXKGB8fMYocFsidy+XXBPdzMxPgl2Bxmk935xBBJ0DD+Gcty
 j1XvabjoHGtqRYRbI3aytRF1rLCJy/qnL6uH5Qjwo2isbCxkSmr83hqGFgfb+rZindmRZkP
 7b5/xPOBLNxbkBZRtB+LF96jEnjSkG6NJ2bAerMk8dCRH4l+CGOCaV+QMLUd8dHLW9DBI4/
 IQgsJ8R9nI5jVnbE38Iog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xNXyt8dZPDc=;Y7uEzsTI8kIrdS2HKx1S7oMARXC
 zhL/9IZGvmHS+qMR1kWXhvEx0vczsVLuzYOS3s50U+Wh4kOFPFY/ipDb106XuODweI2z56ZYs
 epMaAG640SkZGwGkxo69M1FQhxOL86ofKVKBflyZ2q6dGpQhyOisDuATNDI4Da0RSRdCRwpIC
 wRMSldUQLSmAOUIC2Z7HuO+5G+IevRTVI49kTcmUBuN077tL7QQRBkjynLrWZ3SSSKJ9uoeCw
 RHxlZF7VU6ik9L7SCHYTpd0p9S9Q2sOKaCg2h0rWKoTJI1dc3qXedw0Y0JN6hk4dPndniYvAM
 IcGkljfJc78/PJhwKlumc51peBiKPUFXYXcpP1Jnor/n1SkoMn062xnKN00aiB+suto3tuobo
 oiBrqGPsBRh+Ty6fbUX8lAKSjPKS3eF/wCEGXkr6FlRWDlW8Lmp5wr/PmZfoZEUoiiTGblK3i
 Ey+yyh+IZSz4Ek5ZIENH7B4oyMdZApIiYIGvsupHXyo0F1YHvmjO8/K2eNIhcitjX1HRWrqRQ
 2JGfYGXZry6ursP07yqg/N0FCOuzzHDrpKQUSA+Z2FkoyedUr0IUYgHOlFmaC68041rele+lD
 2cug/M1AeebbQ68vxJFAA8ZI20IjTd7qObtFGEYUoneUNA/BR0/DoHTlxFPBMWHijnY1ZW6Fg
 Q5awNCoSI3V0k9sX3r1ReXcvlgT59yf5zk/e0ihl3a7dZbYEUihTv2d0y50NEmVpnPkWJ+V55
 NoqUyej3dphqT2IscNXw9F9aTiCntferd1ug6KOLmSh9O02PeaE/XxnjwKREdfRonSaN1Q84A
 Q6jpoxvLdnimwOaHSn/yZwiRAXm4FacX7YZbhoPrhcdUg=
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 24/26] media: venus: venc: Make
 explicit the range of us_per_frame
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

PiBVbmxlc3MgdGhlIGZwcyBpcyBzbWFsbGVyIHRoYW4gMC4wMDAyMzI4MjkgZnBzLCB0aGlzIGZp
dHMgaW4gYSAzMiBiaXQgbnVtYmVyLgo+IE1ha2UgdGhhdCBleHBsaWNpdC4KCldvdWxkIGl0IGJl
IG1vcmUgYXBwcm9wcmlhdGUgdG8gbW92ZSB0aGUgd29yZCDigJxleHBsaWNpdOKAnSB0byB0aGUg
ZW5kCm9mIHRoZSBzdW1tYXJ5IHBocmFzZT8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
