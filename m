Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326C6B3C95
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 11:43:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2321C6A60E;
	Fri, 10 Mar 2023 10:43:39 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24655C640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 10:43:38 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id b13so4837381ljf.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 02:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678445017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6D8DgvSllDpIpjkRMtHsbcOPCoCHnTYInoVGhS4b+QA=;
 b=nCHfG0VG+xIVMI3Uz30+lCPQjHMFNzvzKvLr/uxFUsFQf3sK0QzWXC1lkMYIpnb+yo
 kTfC3hUaq8cgGe9xMk6AcbdnaIcg7HQQTQy9FYUYrxXA8lGpEBgL1Dmir6Vjlq8dfPLs
 C7qPdt6AmXMhTO+LAlZFKkmu7qpBvf+EAlj48MXE+EFWNTkHYnE9PYxJfTlLY0JQzVRe
 AVPRBJUNvn2rznC1jaKvMtoRuQcxNZy6ZCXkCfDrMOAox6Fj/UPpj2Qw3RPLR5Sm6Qw0
 QLFfzrkeRntLiy2SEYLW90oHWj4Bztsxrd9uCIC8aMvEDbCJnw1v2hI9WbY/GoLyvewF
 cJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678445017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6D8DgvSllDpIpjkRMtHsbcOPCoCHnTYInoVGhS4b+QA=;
 b=EBv3etjSvZkRHUs0ia+WCHyTvmeSHz72QbbGoOoPUwmY/wimbF8EatiOKe6wWbgSGB
 nM6GuX15wIdr6cD65Pk2bnN+L4A3PNJV6R+ysdpV9DLDDCYRxd4g3xqcDzkW8zXCa7n2
 tMvcSbrhmp6WIg+q9TIhr4OPxUK7iTytFBkoPEHPUFSZEUdLMKJ3yjaz/EO9BcA2Es0b
 v6Udl1sJevKSiFfUjDp6WMe+SsKF5X/MheVBD4wTOfDGm5KER9FQ5+Wp76qpxFWAWknw
 eLlAAlVqaES80IAAbuX8N03iPhyIn02hlrYzB7x+PbvsEnyBVQs7onab4pk5t8e3mdyh
 dTFw==
X-Gm-Message-State: AO0yUKUhJ/DmFKWWyA0jm0N3WWC1MEY3lODNLqbGyQRZRNKSME7OOP8W
 QfiePqw9dGJICzwih8XnVpM=
X-Google-Smtp-Source: AK7set+p71/bzHEgwcLpPLO/Pz2JDQS28ccp+iIU3K53kTB52otuWjNtgd3ESU/TF0IRcMCTp5ShaA==
X-Received: by 2002:a2e:4619:0:b0:290:8289:8cba with SMTP id
 t25-20020a2e4619000000b0029082898cbamr310434lja.8.1678445017151; 
 Fri, 10 Mar 2023 02:43:37 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 l20-20020a2e9094000000b00297dad1a2b0sm187498ljg.103.2023.03.10.02.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 02:43:36 -0800 (PST)
Message-ID: <453c9298-d64a-aa77-28ba-ac986dfdd722@gmail.com>
Date: Fri, 10 Mar 2023 11:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20230309112028.19215-1-zajec5@gmail.com>
 <ac94f04b-4b25-81e4-386f-55b0a2c7c85f@linaro.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <ac94f04b-4b25-81e4-386f-55b0a2c7c85f@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Walle <michael@walle.cc>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH V3] nvmem: add explicit config option to
 read OF fixed cells
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

T24gMTAuMDMuMjAyMyAxMDoyMiwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPiAKPiBPbiAw
OS8wMy8yMDIzIDExOjIwLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4+IEZyb206IFJhZmHFgiBN
acWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4KPj4gTlZNRU0gc3Vic3lzdGVtIGxvb2tzIGZv
ciBmaXhlZCBOVk1FTSBjZWxscyAoc3BlY2lmaWVkIGluIERUKSBieQo+PiBkZWZhdWx0LiBUaGlz
IGJlaGF2aW91ciB3YXMgdG90YWxseSBzYWZlIGluIGVhcmx5IGRheXMgYmVmb3JlIGFkZGluZwo+
PiBzdXBwb3J0IGZvciBkeW5hbWljIGNlbGxzIGFuZCB3aXRoIHNpbXBsZSBEVCBzeW50YXguCj4+
Cj4+IFdpdGggZXZlcnkgbmV3IHN1cHBvcnRlZCBOVk1FTSBkZXZpY2Ugd2l0aCBkeW5hbWljIGNl
bGxzIHRoZSBjdXJyZW50Cj4+IGJlaGF2aW91ciBiZWNvbWVzIG5vbi1vcHRpbWFsOgo+PiAxLiBJ
dCByZXN1bHRzIGluIHVubmVlZGVkIGl0ZXJhdGluZyBvdmVyIERUIG5vZGVzCj4+IDIuIEl0IG1h
eSByZXN1bHQgaW4gZmFsc2UgZGlzY292ZXJ5IG9mIGNlbGxzIChpbiBjYXNlIERUIHN1Ym5vZGVz
Cj4+IMKgwqDCoCBjb250YWluICJyZWciIHByb3BlcnR5KQo+Pgo+IAo+IEFtIHJlYWxseSBub3Qg
c3VyZSB3aGF0IGlzIGdvaW5nIG9uIGhlcmUsCj4gSSBkaWQgcmFpc2Ugc29tZSBpc3N1ZXMgd2l0
aCB0aGlzIG92ZXJhbGwgYXBwcm9jaCB0byBzdGFydCB3aXRoIGF0IFsxXSBub25lIG9mIHdoaWNo
IGFyZSBkaXNjdXNzZWQgYW5kIG5vdyBJIHNlZSB2MyA6LSkKPiAKPiBbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDIzMDMwOTA5NDAxMC4xMDUxNTczLTEtbWljaGFlbEB3YWxsZS5j
Yy9ULyNtNzcwNmI2NDA5NzlhYWJmMjUxNDM2ZTAxN2I4MTg5NDEzNjYxYTUzYQoKSSB1cGRhdGVk
IGNvbW1pdCBtZXNzYWdlIHRvIGFkZHJlc3MgeW91ciBjb25jZXJucy4gSSB0aG91Z2h0IEkgbWFk
ZSBpdApjbGVhci4gSSBkb24ndCBrbm93IGhvdyB0byBlbXBoYXNpemUgaXQgYmV0dGVyLgoKSSds
bCB0cnkgdG8gYW5zd2VyIG5ldmVydGhlbGVzcywgcGxlYXNlIHNlZSBiZWxvdy4KCgpPbiA5LjAz
LjIwMjMgMTA6MzcsIFNyaW5pdmFzIEthbmRhZ2F0bGEgd3JvdGU6CiA+IE9uIDI0LzAyLzIwMjMg
MDc6MjksIFJhZmHFgiBNacWCZWNraSB3cm90ZToKID4+IEZyb206IFJhZmHFgiBNacWCZWNraSA8
cmFmYWxAbWlsZWNraS5wbD4KID4+CiA+PiBOVk1FTSBzdWJzeXN0ZW0gbG9va3MgZm9yIGZpeGVk
IE5WTUVNIGNlbGxzIChzcGVjaWZpZWQgaW4gRFQpIGJ5CiA+PiBkZWZhdWx0LiBUaGlzIGJlaGF2
aW91ciBtYWRlIHNlbnNlIGluIGVhcmx5IGRheXMgYmVmb3JlIGFkZGluZyBzdXBwb3J0CiA+PiBm
b3IgZHluYW1pYyBjZWxscy4KID4+CiA+PiBXaXRoIGV2ZXJ5IG5ldyBzdXBwb3J0ZWQgTlZNRU0g
ZGV2aWNlIHdpdGggZHluYW1pYyBjZWxscyBjdXJyZW50CiA+PiBiZWhhdmlvdXIgYmVjb21lcyBu
b24tb3B0aW1hbC4gSXQgcmVzdWx0cyBpbiB1bm5lZWRlZCBpdGVyYXRpbmcgb3ZlciBEVAogPj4g
bm9kZXMgYW5kIG1heSByZXN1bHQgaW4gZmFsc2UgZGlzY292ZXJ5IG9mIGNlbGxzIChkZXBlbmRp
bmcgb24gdXNlZCBEVAogPj4gcHJvcGVydGllcykuCiA+CiA+PgogPj4gVGhpcyBiZWhhdmlvdXIg
aGFzIGFjdHVhbGx5IGNhdXNlZCBhIHByb2JsZW0gYWxyZWFkeSB3aXRoIHRoZSBNVEQKID4+IHN1
YnN5c3RlbS4gTVREIHN1YnBhcnRpdGlvbnMgd2VyZSBpbmNvcnJlY3RseSB0cmVhdGVkIGFzIE5W
TUVNIGNlbGxzLgogPj4KID4+IEFsc28gd2l0aCB1cGNvbWluZyBzdXBwb3J0IGZvciBOVk1FTSBs
YXlvdXRzIG5vIG5ldyBiaW5kaW5nIG9yIGRyaXZlcgogPj4gc2hvdWxkIHN1cHBvcnQgZml4ZWQg
Y2VsbHMgZGVmaW5lZCBpbiBkZXZpY2Ugbm9kZS4KID4KID4gVGhpcyBpcyBub3QgdmVyeSBjbGVh
ciwgYXJlIHlvdSBzYXlpbmcgdGhhdCB3ZSBzaG91bGQgbm90IHN1cHBvcnQgZml4ZWQgY2VsbHM/
IElmIHRoYXQgaXMgdGhlIGNhc2UgdGhlbiB5b3UgYXJlIHByb2FiYWJseSB0YWtpbmcgdGhpcyBp
biB3cm9uZyBkaXJlY3Rpb24uIG52bWVtIHdhcyBidWlsdCBiYXNlZCBvbiB0aGUgZmFjdCB0aGF0
IGRyaXZlcnMgY2FuIHJlYWQgZnJvbSBhIGZpeGVkIG9mZnNldHMuIER5bmFtaWMgY2VsbHMgaXMg
c29tZXRoaW5nIHZlcnkgbmV3LCB0aGF0IGRvZXMgbm90IG1lYW4gdGhhdCB3ZSBzaG91bGQgZGl0
Y2ggZml4ZWQgY2VsbHMgc3VwcG9ydCBpbiBkdC4KCkkgRE9OJ1QgZGVwcmVjYXRlIG9yIGRyb3Ag
c3VwcG9ydCBmb3IgZml4ZWQgbGF5b3V0cyAoZml4ZWQgTlZNRU0gY2VsbHMpLgpQZXJpb2QuCkkg
V09OJ1QgZHJvcCBzdXBwb3J0IGZvciBvbGQgYmluZGluZy4gV2Ugc3RheSBiYWNrd2FyZCBjb21w
YXRpYmxlLgpQZXJpb2QuCgpJbiB0aGlzIHBhdGNoJ3MgYm9keSBJIHdyb3RlOgoid2l0aCB0aGUg
c3VwcG9ydCBmb3IgTlZNRU0gbGF5b3V0cyB3ZSBtYXkgJiBzaG91bGQgaGF2ZSAqbmV3KiBiaW5k
aW5ncyBhbGxvdyBmaXhlZCBOVk1FTSBjZWxscyBvbmx5IGluIHRoZSAibnZtZW0tbGF5b3V0IiBz
dWJub2RlIgp0aGF0IGNsZWFybHkgbWVhbnMgSSBzdGlsbCB3YW50IHRvIEFMTE9XIGZpeGVkIE5W
TUVNIGNlbGxzIC0ganVzdCBpbiB0aGUgKm52bWVtLWxheW91dCogbm9kZS4KCkkgd2FudCB0byBL
RUVQIHN1cHBvcnQgZm9yIGZpeGVkIE5WTUVNIGNlbGxzLgpJIGp1c3Qgd2FudCB0aGVtIHRvIGJl
IHByZWZlcmFibHkgZGVmaW5lZCBpbiB0aGUgIm52bWVtLWxheW91dCIgbm9kZS4KCgogPj4gU29s
dmUgdGhpcyBieSBtb2RpZnlpbmcgZHJpdmVycyBmb3IgYmluZGluZ3MgdGhhdCBzdXBwb3J0IHNw
ZWNpZnlpbmcKID4+IGZpeGVkIE5WTUVNIGNlbGxzIGluIERULiBNYWtlIHRoZW0gZXhwbGljaXRs
eSB0ZWxsIE5WTUVNIHN1YnN5c3RlbSB0bwogPj4gcmVhZCBjZWxscyBmcm9tIERULgogPgogPiBT
aG91bGRuJ3QgdGhpcyBiZSBvcHBvc2l0ZSwgbGV0IHRoZSBuZXcgcHJvdmlkZXJzIHRlbGwgdGhh
dCBjZWxscyBhcmUgY3JlYXRlZCBhdCBydW50aW1lPwogPgogPiBvciBldmVuIGJldHRlciBpZiB0
aGVyZSBpcyBhIHdheSB0byBkZXRlY3QgaWYgd2UgY2FuIHNldCB0aGlzIGZsYWcgZHluYW1pY2Fs
bHkgYmFzZWQgb24gbGF5b3V0L3Bvc3QtcHJvY2Vzc2luZyBjb25maWd1cmF0aW9uLgogPgogPiB0
aGF0IHNob3VsZCBiZSBtdWNoIGNsZWFuZXIgYXBwcm9jaC4KCkkgdHJpZWQgdG8gYWRkcmVzcyB0
aGlzIGNvbmNlcnQgaW4gdGhlIGZvbGxvd2luZyBwYXJ0IG9mIGNvbW1pdCBib2R5OgoKID4gVGhl
IGJlc3QgYXBwcm9hY2ggc2VlbXMgdG8gYmUgbWFraW5nIE5WTUVNIGNvcmUgbG9va2luZyBmb3Ig
Zml4ZWQgRFQKID4gY2VsbHMgaW4gKipkZXZpY2UqKiBub2RlIGFuIG9wdC1pbiBmZWF0dXJlLiBJ
dCdzIGEgZmVhdHVyZSB0aGF0IG92ZXIKID4gdGltZSBzaG91bGQgZ2V0IGRlcHJlY2F0ZWQgaW4g
YSBmYXZvciBvZiB1c2luZyAibnZtZW0tbGF5b3V0cyIgYWxzbyBmb3IKID4gZml4ZWQgTlZNRU0g
Y2VsbHMuCgpOZXcgTlZNRU0gcHJvdmlkZXIgYmluZGluZ3MgYW5kIGRyaXZlcnMgd2lsbCBnZXQg
ZGV2ZWxvcGVkLiBJIHdvdWxkCndhbnQgYWxsIG5ldyBiaW5kaW5ncyB0byB1c2UgIm52bWVtLWxh
eW91dCIgZm9yIGRlc2NyaWJpbmcgTlZNRU0gY2VsbHMKKG5vIG1hdHRlciBpZiBmaXhlZCBvciBk
eW5hbWljKS4KClRoYXQgbWVhbnMgYWxsIG5ldyBkcml2ZXJzIFdJTEwgTk9UIG5lZWQgdG8gc2V0
ICJ1c2VfZml4ZWRfb2ZfY2VsbHMiLgoKU28gb3ZlciB0aW1lICJ1c2VfZml4ZWRfb2ZfY2VsbHMi
IHdpbGwgYmVjb21lIGEgbWlub3JpdHkuIEl0J3cgd291bGQgYmUKcGl0dHkgdG8gaGF2ZSBldmVy
eSBuZXcgZHJpdmVyIHRvIHJlcXVlc3QgTlZNRU0gY29kZSB0byBza2lwIGxvb2tpbmcgZm9yCk5W
TUVNIGNlbGxzIGluICoqZGV2aWNlKiogbm9kZS4KClNvIG15IGFuc3dlciBpczogbm8uIEkgZG9u
J3QgYmVsaWV2ZSBpdCBzaG91bGQgYmUgb3Bwb3NpdGUuIExvb2tpbmcgZm9yCmZpeGVkIE5WTUVN
IGNlbGxzIGluICoqZGV2aWNlKiogRFQgbm9kZSBzaG91bGQgYmUgYW4gb3B0LWluLgoKSWYgYnkg
c29tZSBtaXJhY2xlIEkgbWFuYWdlIHRvIGdldCBteSBwYXRjaGVzIHRocm91Z2ggdGhlbiB5b3Un
bGwgZm9yZ2V0CmFib3V0ICJ1c2VfZml4ZWRfb2ZfY2VsbHMiIG5leHQgbW9udGguIE5vb25lIHdp
bGwgbmVlZCBpdCBmb3IgYW55IG5ldwpzdHVmZi4gSXQnbGwgc3RheSBmb3IgYmFja3dhcmQgY29t
cGF0aWJpbGl0eSBvbmx5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
