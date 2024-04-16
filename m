Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC58A6475
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 09:04:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56A97C6B45B;
	Tue, 16 Apr 2024 07:04:46 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FC6DC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 07:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1713251047; x=1713855847; i=markus.elfring@web.de;
 bh=11Y55v0AlzuRPO7ifOFiCZQ7lrJESQhpZwvX7xtpFpc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=uYYpoJTmRqgk2fHBG3KnNz2CLPavpRrEfJtq6/fkxsSHPHo9hr9qcnbetfR4rbAv
 WWYYcMCU5QC3KoHYZsERO/uCRV2oxChX6X+Rafq4yYRbQohsxFKvostPltnlOgZUZ
 uF9kX12zxQQdi44vnDxMP2KDpxbIBaLpo5hqzClbmR4INeL93ovd+wCPNkORolTKA
 RsWEq1pb7kj6jurgWDs/BjuRAGZTklJtZ686dqKAidxv8QQmS4EmEZg2pw3cisyw+
 IuhR26xDJ4uJ6w3UN1gJ6I/LtVomRg8m99Raf/c0Fc4QVAeD0lf4ST2m6UyLR9hF4
 nOhZqEsl8lmkPGi/9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mvspv-1smFwO1js7-010uHt; Tue, 16
 Apr 2024 09:04:07 +0200
Message-ID: <e0377059-4073-4779-8385-506b9b39301e@web.de>
Date: Tue, 16 Apr 2024 09:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Alain Volmat <alain.volmat@foss.st.com>,
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
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, Sergey Kozlov <serjk@netup.ru>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
References: <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
X-Provags-ID: V03:K1:sHR+TeGSFgoxPZvFUHAPIEuDVzgT2GvvVwRx2R0bQhoUCLrY21q
 4aVwGDwLU20D7GafylHrOJidGYSPJoSoIzoqf+nPfG0K+ORf8VF8LHB5EhsUv86XaNhisus
 3kmBAPbDemt8Lc42bbQEjY39bQYWH3PtxU6pQC03uggivELLPehSfNoyDhXXBzC0UmXhKFx
 xJrtOT5azfeT6A+OIpOdg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:03HI85af2Ns=;yQ8sKTONouBI76raH8Z58fLgdPG
 cDRdjqAFM/3eXwECjUZI9h4p6mlw8k+SOXiyN6GfwXod9KAZJOxaNqbO06huy2pgBzYXWcxaK
 1yvcUyUm5nteIAvRh5GEJ6k2V8yU4C8rRXv94JjainnOHsSdDuPbk0aZXSWp65ziquDFaUUDN
 YJZN7AsXSRRYZMDVispdvHubrvkMarfGAxoCn4+Sw/adTSJ9UOxI6QREc49RSDDGj50+NsVZA
 I9/YrIlsRw4OeLnNC7dBSfeh2gas2lmTVPAdeZE5dk0sIs7aiTx7Cpr5FEHhCUFXrkReal3EO
 gELP/4ATALLJIJbZL8oac+FZhSpqW5irTqlO//L3y6eUAaDcuOSIPWLoaYJ2J97IzS1c9eCBT
 dPZVw6RcJR7I1g+6lDJwbla9AWsE0cHKjE7xI2z8RiMQz8Rg1JfobeDUi4lCAeun4aY23r5ct
 YWwBdDrs6QXbNlkfk+vAwFpDgJQbH27hI7BnJLDoXByi4vvXAuZw1dpfEkQ80cUKCCCXCdn7X
 PvxRBpoBI4VG9b+hFjsF5IAAMMrnv9iTADoQIOgnuUIHJ96lnDCSfdzxHRFAWt2M+05cdkCb1
 Xd22EYiLsJxLnQ9xjjeW2wTuQRB2DVUy1LO2KuI3z2ZDeT+FU9j9vuFhJTTTlhlzwnv9ycOI2
 FCqhmVe/n6PxH/5bS4hKkm4lYwNU/GheqGDyJrBHSbogo2OEAjGtEGI1SveFeBPQ/PKRQkiQ8
 msmag1gLjDLzUZ3GnLIpmC2bTBr5sENz7Knm/uddln2TX5kDsFZDCPf9L9KYANSpzIuCxNgkh
 +sdpCGJrmyr6dMFVvuLSI8fFEJx9x6/qw+iAMnV+HSLrk=
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/35] media: uvcvideo: Refactor iterators
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

SSB3b3VsZCBmaW5kIGEgaGludCBmb3IgYSB2YXJpYWJsZSBjaGFuZ2UgbW9yZSBhcHByb3ByaWF0
ZSBpbiB0aGUgcGF0Y2ggc3ViamVjdAppbnN0ZWFkIG9mIHRoZSB3b3JkIOKAnGl0ZXJhdG9yc+KA
nS4KCgrigKYKPiArKysgYi9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2N0cmwuYwrigKYKPiBA
QCAtMjE3NSwxNiArMjE3NywxNiBAQCBpbnQgdXZjX3h1X2N0cmxfcXVlcnkoc3RydWN0IHV2Y192
aWRlb19jaGFpbiAqY2hhaW4sCj4gIAlpbnQgcmV0Owo+Cj4gIAkvKiBGaW5kIHRoZSBleHRlbnNp
b24gdW5pdC4gKi8K4oCmCj4gKwllbnRpdHkgPSBOVUxMOwo+ICsJbGlzdF9mb3JfZWFjaF9lbnRy
eShpdGVyLCAmY2hhaW4tPmVudGl0aWVzLCBjaGFpbikgewrigKYKCkkgc3VnZ2VzdCB0byBtb3Zl
IHRoaXMgYXNzaWdubWVudCBpbnRvIHRoZSBkZWZpbml0aW9uIGZvciB0aGUgYWZmZWN0ZWQgbG9j
YWwgdmFyaWFibGUuCgoKQnkgdGhlIHdheToKSSBzZWUgYW5vdGhlciBzb3VyY2UgY29kZSBhZGp1
c3RtZW50IG9wcG9ydHVuaXR5IGluIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCmh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjktcmM0L3NvdXJjZS9kcml2ZXJzL21lZGlh
L3VzYi91dmMvdXZjX2N0cmwuYyNMMjE2NQoKQ2FuIGl0IGJlIG5pY2VyIHRvIHVzZSBsYWJlbHMg
4oCcZnJlZV9kYXRh4oCdIGFuZCDigJx1bmxvY2vigJ0gKGluc3RlYWQgb2Yg4oCcZG9uZeKAnSk/
CkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gaW5jcmVhc2UgdGhlIGFwcGxpY2F0aW9uIG9mIHNj
b3BlLWJhc2VkIHJlc291cmNlIG1hbmFnZW1lbnQgaGVyZT8KClJlZ2FyZHMsCk1hcmt1cwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
