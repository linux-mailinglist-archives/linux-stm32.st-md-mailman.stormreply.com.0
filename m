Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779B69FD96
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Feb 2023 22:15:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A324C6A5F8;
	Wed, 22 Feb 2023 21:15:08 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6717C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 21:15:06 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id o12so36290954edb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 13:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1hpkcdj31Kp+64I0H+8QjpzTiuX76hZTeMvrWdpVOt4=;
 b=Y95tEBQTvJnja0wiaBFlONHEPFFpg4E5Aidd7Wxu88GO6+Efw9s32CSm6Qrv+mXXKE
 i5+x1nQprf7tfF0IcJzKPjG26LQSm8lVS+CQndNmsIeuLxTz3Zws+u23ldaG3K54+WIL
 IKeo6NJCJ7WchtpfymyIpeNWai8L7kAy3lwcxu51e9DNdYZrZ0f3D1Sw8ivAk+CfDKS3
 Ek4oq62+5hOyx3h0ySU4oZmDiESIURoGhUvHFCUOXpdaqhWIldAEFOJmG9Rfku2zdt2S
 XHD98cqCLTBp5a+c55IWJPbpd06egfIFbD37YQMjJACS4ZlT8leLyYR4DAvtMaXLTN/X
 IY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1hpkcdj31Kp+64I0H+8QjpzTiuX76hZTeMvrWdpVOt4=;
 b=ze/IIF2v3XQW4jqPVGDYPESLSPIY3gAYpvDIDSb+Sw2+P8LTIkArrw+swl/4tgs21U
 Djrlhlsl/5aPZoGqsG/+E7IQcIW3YCFklXqPXrgQvaVwRqoowmaR0ST8f+z/eZ0aaF4W
 yP33OyPi5ZHLjpLWQExDTjCiTwR+YT+HS6rp3RfYSCDUsqZiPzcynMTY9vzEfztNkvKc
 qgpT4RT1qzKNbv9lWJjSfl+zD0iToQ4ytNFIbQU9U9vqYpmN0AoHTdI7UwKjElDFB2E9
 8JhaIbbWBP41bk4fjeuvA36rrREiOFqMFfUCbbpsSxhNuL1dVLAG6Un+mOZ82IyiSvYq
 zCgQ==
X-Gm-Message-State: AO0yUKWjU+Jth0xOd9p871UBYP1GTEPPrM9Vf6owaaCCYItdYBvDdoXq
 kmUgcKRTsO7EJmS29G+i/5P+ol5PzRkGHVQ3YDw=
X-Google-Smtp-Source: AK7set8TXb46bTmDPfzW/xczn6QfGU7MdMXPRf/CaO6cyWdNx+3X84yvibHTXzLWWA/EAH5iiZY+OShEAAHjsEGwRMc=
X-Received: by 2002:a50:f611:0:b0:4ac:b7c1:9109 with SMTP id
 c17-20020a50f611000000b004acb7c19109mr4476929edn.6.1677100506156; Wed, 22 Feb
 2023 13:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20230221145021.31993-1-zajec5@gmail.com>
 <CAFBinCDxB=xtz9mtZupBC7J5oxknN1ENHzJ-cFxX4FTDSgZeFQ@mail.gmail.com>
 <101a5bdf-870a-a1bb-954d-1d675ecad5a7@gmail.com>
In-Reply-To: <101a5bdf-870a-a1bb-954d-1d675ecad5a7@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 22 Feb 2023 22:14:55 +0100
Message-ID: <CAFBinCDcDYtdOdikc2ieXjRUkrjgwNKaPYvYZb_v84gh66q=bw@mail.gmail.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGVsbG8gUmFmYcWCLAoKT24gVHVlLCBGZWIgMjEsIDIwMjMgYXQgMTE6MjkgUE0gUmFmYcWCIE1p
xYJlY2tpIDx6YWplYzVAZ21haWwuY29tPiB3cm90ZToKWy4uLl0KPiA+IEkgYW0gbm90IGZhbWls
aWFyIHdpdGggdGhlIHJlY2VudCBjaGFuZ2VzIGFyb3VuZCBkeW5hbWljIGNlbGxzLgo+ID4gSXMg
dGhlcmUgYW55IGRpc2N1c3Npb24vc3VtbWFyeSB0aGF0IEkgY2FuIHJlYWQgdG8gZ2V0IHVwIHRv
IHNwZWVkPwo+Cj4gU29tZSBOVk1FTSBkZXZpY2VzIGRvbid0IHN0b3JlIHNwZWNpZmljIGRhdGEg
YXQgaGFyZGNvZGVkIG9mZnNldHMuIEZvcgo+IHN1Y2ggZGV2aWNlcyB3ZSBoYXZlIGRyaXZlcnMg
KHRvIGJlY29tZTogbGF5b3V0cykgdGhhdCBwYXJzZSB0aGVpciBtYWdpYwo+IGNvbnRlbnQuIFRo
ZXkgZGlzY292ZXIgY2VsbHMgYW5kIHJlZ2lzdGVyIHRoZW0gYW5kIHByb3ZpZGUgbWF0Y2hpbmcg
d2l0aAo+IHByb3BlciBEVCBub2Rlcy4KPgo+IEZvciBiaW5kaW5ncyBzZWU6Cj4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L2NvbW1pdC8/aWQ9MDg0OTczZTk0NGJlYzIxODA0ZjhhZmIwNTE1YjI1NDM0NDM4Njk5YQo+IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xp
bnV4LmdpdC9jb21taXQvP2lkPWE2MDdhODUwYmExZmE5NjZjYmIwMzU1NDRjMTU4OGUyNGE2MzA3
ZGYKPgo+IEZvciBleGFtcGxlIGRyaXZlciBzZWU6Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9NmU5
NzdlYWE4MjgwZTk1N2I4NzkwNGI1MzY2NjE1NTBmMmE2YjNlOAo+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQv
P2lkPTIwNzc3NWY3ZTE3YjhmZDA0MjZhMmFjNGE1YjgxZTRlMWQ3MTg0OWUKPgo+IEZvciB1c2Fn
ZSBzZWU6Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9Yzg0NDJmMGZiMDljYTNkODQyYjliMjNkMWQw
NjUwZjY0OWZkMTBmOApUaGFua3MsIHRoYXQgbWFrZXMgdGhpbmdzIGNsZWFyZXIgZm9yIG1lIQoK
PiA+IE15IG1haW4gdGhvdWdodCBpczogaWYgdGhlcmUgYXJlIG1hbnkgImZpeGVkIE9GIGNlbGxz
IiBpbXBsZW1lbnRhdGlvbnMKPiA+IGFuZCBvbmx5IGEgZmV3ICJkeW5hbWljIiBvbmVzIC0gZG9l
cyBpdCBtYWtlIHNlbnNlIHRvIGZsaXAgdGhlIGxvZ2ljCj4gPiBhbmQgaW50cm9kdWNlIGEgbmV3
ICJ1c2VfZHluYW1pY19vZl9jZWxscyIgZmxhZyBpbnN0ZWFkPwo+Cj4gVGhlIHByb2JsZW0gaXMg
dGhhdCB0aGVyZSBhcmUgbW9yZSBjYXNlcyB0aGFuIGp1c3QgdHdvLiBXZSBjYW4gaGF2ZToKPiAx
LiBObyBjZWxscyBhdCBhbGwKPiAyLiBGaXhlZCBjZWxscyBpbiBEVAo+IDMuIER5bmFtaWMgY2Vs
bHMgd2l0aCByZWZlcmVuY2VzIGluIERUCj4gNC4gRHJpdmVyIHNwZWNpZmllZCBjZWxscyAoc3Bl
Y2lmaWVkIHdpdGhpbiBjb25maWcpCj4gNS4gQ2VsbHMgZGVmaW5lZCBpbiBhIGdsb2JhbCB0YWJs
ZQo+Cj4gU28gd2UgbmVlZCB0byByZWZlcmVuY2UgRFQgY2VsbHMgZXhwbGljaXRseSAod2UgY2Fu
J3QganVzdCBjb25maXJtIC8KPiBkZW55ICpkeW5hbWljKiBjZWxscykuCj4KPiBBbm90aGVyIHNv
bHV0aW9uIHdvdWxkIGJlIHRvIGhhdmUgIm5vX2ZpeGVkX29mX2NlbGxzIiBidXQ6Cj4KPiAxLiBQ
ZXJzb25hbGx5IEkgdGhpbmsgbmVnYXRpb24gaXMgbGVzcyBjbGVhciAvIGVhc3kgdG8gZm9sbG93
Cj4KPiAyLiBUaGVyZSBtYXkgYmUgYWN0dWFsbHkgbW9yZSBkcml2ZXJzIHdpdGggbm8gZml4ZWQg
Y2VsbHMuCj4gSSB0aGluayBJIG1vZGlmaWVkIDE4IGRyaXZlcnMuIEl0IHNlZW1zIGRldm1fbnZt
ZW1fcmVnaXN0ZXIoKSBpcwo+IHJlZmVyZW5jZWQgaW4gNDQgcGxhY2VzLiBGZXcgb2YgdGhlbSBt
YXkgYmUgbm90IGFjdHVhbCB1c2VycyBidXQgaXQKPiBzdGlsbCBzZWVtcyB0byBiZSBhYm91dCBl
cXVhbC4KVGhhbmtzIGZvciB0aGlzIG92ZXJ2aWV3IG9mIGFsbCB0aGUgc3BlY2lhbCBjYXNlcy4g
UGxlYXNlIGFkZCBteToKQWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CmZvciB0aGUgZm9sbG93aW5nIHR3byBkcml2ZXJzOgot
IGRyaXZlcnMvbnZtZW0vbWVzb24tZWZ1c2UuYwotIGRyaXZlcnMvbnZtZW0vbWVzb24tbXgtZWZ1
c2UuYwoKCkJlc3QgcmVnYXJkcywKTWFydGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
