Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CC769EA2D
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Feb 2023 23:29:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20557C6A5F8;
	Tue, 21 Feb 2023 22:29:54 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F384CC6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Feb 2023 22:29:52 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id m6so7728812lfq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Feb 2023 14:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rRskwuzUoTseJ7UhE/XiQ/ajutHbx9Jd0AO9KzeF2SA=;
 b=aKFAgFAHiqsL++CU0NQXI3ge3qCJTJWe9hhri5lPXhyFoAESWMM21NLBBPU5G6cNJY
 35lsLXaqrC6Mb6smUaE+WcAfzrsm9gqxGTNY/iMY66IU87+YokTiPTcPT4MAg1ufPqqN
 fQ16flQ0OJ/1LjzFEPXttIEaZA+BGgA59wa2q62W00rcvD7z7rqT3ayvBS5tl0ppMcJn
 IkWVdlg7bPBPCodv4v7h8EVO01zPwNKlvuZ5IwuJgkB8t2e6se9vm3VG4j3pdft/mnmu
 U8Eefz5MvvrPId0lV3ihpW8DC9KN/oUDLeqrl8gAIQSSSvZLw+145WXRdzkKwlM3xuel
 UKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rRskwuzUoTseJ7UhE/XiQ/ajutHbx9Jd0AO9KzeF2SA=;
 b=Q3F2UdP4HkHDY9kcEcVUr4ZMavAU2yN7BrrwDM/6gmOiOVjyCUnJWwqDUj2J8pRSvC
 cWbhwg2R/nZ0L6FikmjJrbmL46OANGkYw2uiNBuif9codzBexTLMK8Ekvc18Ymkr/e8j
 0/+4qMo2WmAoLU44JkUdvE7bGExzL7nBRMPwdqM5ifUcIqbz025MSNrDlMd4eBFSu2Vt
 RU0sJ33RNMSi7cwA5bk8zBvUVBsJHIa9aYHkqca3HjYsKmJ6FSIyBQN6BaWBH/CEXW/1
 NbUlFf1gt0nPrE2DoAsRTtMB1e2b1YFJV8+bKLCMfwFhLF7eP2vYMs4c+s3zSo5vTq5E
 OH4g==
X-Gm-Message-State: AO0yUKVmhaIR4qfEMDIFA45cl2vFjHT4bXWo3vhFfMdkb5fIKBDSBhBu
 w9jwbQzrQkyLTzlJKccSEdU=
X-Google-Smtp-Source: AK7set+yBQHNb9hSkW8dFReCGvYH5kUaeuCwO556jqZU4gWvC3OnNb7bh1PGOn5AYoyDdgoJfAwP7w==
X-Received: by 2002:a05:6512:14b:b0:4db:5122:2099 with SMTP id
 m11-20020a056512014b00b004db51222099mr1807349lfo.32.1677018591920; 
 Tue, 21 Feb 2023 14:29:51 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 x25-20020ac259d9000000b004caf992bba9sm1957069lfn.268.2023.02.21.14.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 14:29:51 -0800 (PST)
Message-ID: <101a5bdf-870a-a1bb-954d-1d675ecad5a7@gmail.com>
Date: Tue, 21 Feb 2023 23:29:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20230221145021.31993-1-zajec5@gmail.com>
 <CAFBinCDxB=xtz9mtZupBC7J5oxknN1ENHzJ-cFxX4FTDSgZeFQ@mail.gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <CAFBinCDxB=xtz9mtZupBC7J5oxknN1ENHzJ-cFxX4FTDSgZeFQ@mail.gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Evgeniy Polyakov <zbr@ioremap.net>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Richard Weinberger <richard@nod.at>, Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Vincent Shih <vincent.sunplus@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] nvmem: add explicit config option to read
	OF fixed cells
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMjEuMDIuMjAyMyAyMjozOCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBUdWUs
IEZlYiAyMSwgMjAyMyBhdCAzOjUwIFBNIFJhZmHFgiBNacWCZWNraSA8emFqZWM1QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4K
Pj4KPj4gTlZNRU0gc3Vic3lzdGVtIGxvb2tzIGZvciBmaXhlZCBOVk1FTSBjZWxscyAoc3BlY2lm
aWVkIGluIERUKSBieQo+PiBkZWZhdWx0LiBUaGlzIGJlaGF2aW91ciBtYWRlIHNlbnNlIGluIGVh
cmx5IGRheXMgYmVmb3JlIGFkZGluZyBzdXBwb3J0Cj4+IGZvciBkeW5hbWljIGNlbGxzLgo+Pgo+
PiBXaXRoIGV2ZXJ5IG5ldyBzdXBwb3J0ZWQgTlZNRU0gZGV2aWNlIHdpdGggZHluYW1pYyBjZWxs
cyBjdXJyZW50Cj4+IGJlaGF2aW91ciBiZWNvbWVzIG5vbi1vcHRpbWFsLiBJdCByZXN1bHRzIGlu
IHVubmVlZGVkIGl0ZXJhdGluZyBvdmVyIERUCj4+IG5vZGVzIGFuZCBtYXkgcmVzdWx0IGluIGZh
bHNlIGRpc2NvdmVyeSBvZiBjZWxscyAoZGVwZW5kaW5nIG9uIHVzZWQgRFQKPj4gcHJvcGVydGll
cykuCj4gSSBhbSBub3QgZmFtaWxpYXIgd2l0aCB0aGUgcmVjZW50IGNoYW5nZXMgYXJvdW5kIGR5
bmFtaWMgY2VsbHMuCj4gSXMgdGhlcmUgYW55IGRpc2N1c3Npb24vc3VtbWFyeSB0aGF0IEkgY2Fu
IHJlYWQgdG8gZ2V0IHVwIHRvIHNwZWVkPwoKU29tZSBOVk1FTSBkZXZpY2VzIGRvbid0IHN0b3Jl
IHNwZWNpZmljIGRhdGEgYXQgaGFyZGNvZGVkIG9mZnNldHMuIEZvcgpzdWNoIGRldmljZXMgd2Ug
aGF2ZSBkcml2ZXJzICh0byBiZWNvbWU6IGxheW91dHMpIHRoYXQgcGFyc2UgdGhlaXIgbWFnaWMK
Y29udGVudC4gVGhleSBkaXNjb3ZlciBjZWxscyBhbmQgcmVnaXN0ZXIgdGhlbSBhbmQgcHJvdmlk
ZSBtYXRjaGluZyB3aXRoCnByb3BlciBEVCBub2Rlcy4KCkZvciBiaW5kaW5ncyBzZWU6Cmh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC9jb21taXQvP2lkPTA4NDk3M2U5NDRiZWMyMTgwNGY4YWZiMDUxNWIyNTQzNDQzODY5OWEK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L2NvbW1pdC8/aWQ9YTYwN2E4NTBiYTFmYTk2NmNiYjAzNTU0NGMxNTg4ZTI0YTYz
MDdkZgoKRm9yIGV4YW1wbGUgZHJpdmVyIHNlZToKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9NmU5Nzdl
YWE4MjgwZTk1N2I4NzkwNGI1MzY2NjE1NTBmMmE2YjNlOApodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD0y
MDc3NzVmN2UxN2I4ZmQwNDI2YTJhYzRhNWI4MWU0ZTFkNzE4NDllCgpGb3IgdXNhZ2Ugc2VlOgpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvY29tbWl0Lz9pZD1jODQ0MmYwZmIwOWNhM2Q4NDJiOWIyM2QxZDA2NTBmNjQ5ZmQx
MGY4CgoKPiBNeSBtYWluIHRob3VnaHQgaXM6IGlmIHRoZXJlIGFyZSBtYW55ICJmaXhlZCBPRiBj
ZWxscyIgaW1wbGVtZW50YXRpb25zCj4gYW5kIG9ubHkgYSBmZXcgImR5bmFtaWMiIG9uZXMgLSBk
b2VzIGl0IG1ha2Ugc2Vuc2UgdG8gZmxpcCB0aGUgbG9naWMKPiBhbmQgaW50cm9kdWNlIGEgbmV3
ICJ1c2VfZHluYW1pY19vZl9jZWxscyIgZmxhZyBpbnN0ZWFkPwoKVGhlIHByb2JsZW0gaXMgdGhh
dCB0aGVyZSBhcmUgbW9yZSBjYXNlcyB0aGFuIGp1c3QgdHdvLiBXZSBjYW4gaGF2ZToKMS4gTm8g
Y2VsbHMgYXQgYWxsCjIuIEZpeGVkIGNlbGxzIGluIERUCjMuIER5bmFtaWMgY2VsbHMgd2l0aCBy
ZWZlcmVuY2VzIGluIERUCjQuIERyaXZlciBzcGVjaWZpZWQgY2VsbHMgKHNwZWNpZmllZCB3aXRo
aW4gY29uZmlnKQo1LiBDZWxscyBkZWZpbmVkIGluIGEgZ2xvYmFsIHRhYmxlCgpTbyB3ZSBuZWVk
IHRvIHJlZmVyZW5jZSBEVCBjZWxscyBleHBsaWNpdGx5ICh3ZSBjYW4ndCBqdXN0IGNvbmZpcm0g
LwpkZW55ICpkeW5hbWljKiBjZWxscykuCgpBbm90aGVyIHNvbHV0aW9uIHdvdWxkIGJlIHRvIGhh
dmUgIm5vX2ZpeGVkX29mX2NlbGxzIiBidXQ6CgoxLiBQZXJzb25hbGx5IEkgdGhpbmsgbmVnYXRp
b24gaXMgbGVzcyBjbGVhciAvIGVhc3kgdG8gZm9sbG93CgoyLiBUaGVyZSBtYXkgYmUgYWN0dWFs
bHkgbW9yZSBkcml2ZXJzIHdpdGggbm8gZml4ZWQgY2VsbHMuCkkgdGhpbmsgSSBtb2RpZmllZCAx
OCBkcml2ZXJzLiBJdCBzZWVtcyBkZXZtX252bWVtX3JlZ2lzdGVyKCkgaXMKcmVmZXJlbmNlZCBp
biA0NCBwbGFjZXMuIEZldyBvZiB0aGVtIG1heSBiZSBub3QgYWN0dWFsIHVzZXJzIGJ1dCBpdApz
dGlsbCBzZWVtcyB0byBiZSBhYm91dCBlcXVhbC4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
