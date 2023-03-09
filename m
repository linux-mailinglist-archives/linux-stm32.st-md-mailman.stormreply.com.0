Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B636B2396
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 13:01:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1147EC6A60C;
	Thu,  9 Mar 2023 12:01:26 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DD99C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 12:01:24 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id h3so1528300lja.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 04:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678363283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4GSqIKfh+fPPQrFXuCrH3ba1s5AAafXmlJ7Rizwh8Y=;
 b=PKXkA4WiA8duFtEJwBSGgeMQh5pTE1KoLqyioyMj57ImMT8E5tzaJa8Cezr5Ac+udB
 dohArEBcvlwsvfpPY/VkRXG5pxCBioA5v30rcjLDCviR5gJkkP+XEeaxVWr0R1GXSFvu
 mY8AgbmcW96ld6ZTFuaKaIVYvXqY/NhH4+SN/hXF64q2DtSBpOxlBJylrbxJP0DtVtbJ
 TcNfMSR8WLEoUXOdxw7vbbTtl0ApDDk2b+AAUsrOlX0v292IdbqAfhmHmtHrqnLZPbyl
 GnohTfVo+Y+Anb2hVBX+PfQYYZpSMgOXg1CmZBureC9Z8PeQccZB2IijuNg/SeGIYztr
 dS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678363283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=J4GSqIKfh+fPPQrFXuCrH3ba1s5AAafXmlJ7Rizwh8Y=;
 b=z5FvXWL2mr+Hj6rp6yAphXXmrHHhCzPW+K/CtnaM4kGYPNdLMHuP8nE6VXU3Oo9ZqW
 DSuXukHRccJcNg0TcGwgugSWy0I3Vmw/cTkmSXT53fnUT+SNjUzy5Gf+NNTZL2/kADKk
 KFgTQBWrAoJ4o6LVJbW4nA30Ccat1ABEK5AS/YJp+w3vQyPRTuyTW+/WENV3pvzuU6v1
 lV6BDi9Tz4Y/iIvgdMJyaya5fYpW8T9plziK6YZG1WvnQLeQw5OMKeZOr9mlnZscYy95
 EymlIUd/aqVCwcfjr+wL8hG+rscXeU5h0Xei6uEqW7l/roIqwHm6a4vgO4hnS9hsWqdC
 qq/Q==
X-Gm-Message-State: AO0yUKWkomzzmZ5ZZeXkrZPnPNClX5f8Symt0X46t8m9POXJwf5WntqJ
 PJuD/ocE3GesITb8PiQ8/+I=
X-Google-Smtp-Source: AK7set+NMF/8gy2PgvVPpR4O7pSBLhYbUzPDmj5xP0+SqTAcGzlCByQXPVnKs759lKsD9WYcfwK9nw==
X-Received: by 2002:a05:651c:b1f:b0:290:4d4b:481f with SMTP id
 b31-20020a05651c0b1f00b002904d4b481fmr7275446ljr.16.1678363283077; 
 Thu, 09 Mar 2023 04:01:23 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 s2-20020a2e98c2000000b002934fce87bfsm2846420ljj.108.2023.03.09.04.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 04:01:22 -0800 (PST)
Message-ID: <e845b38c-d0eb-716c-dc51-b89582750f07@gmail.com>
Date: Thu, 9 Mar 2023 13:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20230309112028.19215-1-zajec5@gmail.com>
 <20230309123513.43b7134f@xps-13>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230309123513.43b7134f@xps-13>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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
 Kevin Hilman <khilman@baylibre.com>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
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

T24gOS4wMy4yMDIzIDEyOjM1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oIGIvaW5jbHVkZS9saW51eC9udm1lbS1wcm92
aWRlci5oCj4+IGluZGV4IDAyNjJiODYxOTRlYi4uYjNjMTRjZTg3YTY1IDEwMDY0NAo+PiAtLS0g
YS9pbmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9u
dm1lbS1wcm92aWRlci5oCj4+IEBAIC03Myw2ICs3Myw3IEBAIHN0cnVjdCBudm1lbV9jZWxsX2lu
Zm8gewo+PiAgICAqIEBvd25lcjoJUG9pbnRlciB0byBleHBvcnRlciBtb2R1bGUuIFVzZWQgZm9y
IHJlZmNvdW50aW5nLgo+PiAgICAqIEBjZWxsczoJT3B0aW9uYWwgYXJyYXkgb2YgcHJlLWRlZmlu
ZWQgTlZNRU0gY2VsbHMuCj4+ICAgICogQG5jZWxsczoJTnVtYmVyIG9mIGVsZW1lbnRzIGluIGNl
bGxzLgo+PiArICogQHVzZV9maXhlZF9vZl9jZWxsczoJUmVhZCBmaXhlZCBOVk1FTSBjZWxscyBm
cm9tIE9GLgo+IAo+IEknbSBzdGlsbCB1bmhhcHB5IHdpdGggdGhlIG5hbWluZywgZXNwZWNpYWxs
eSBzaW5jZSB5b3UgZXhwbGFpbmVkIGluCj4gbW9yZSBkZXRhaWxzIHRoZSB3aG9sZSBwbGFuIHdo
aWNoIGludm9sdmVzIHVzaW5nIGEgY29udGFpbmVyIHRvIHB1dAo+IHRoZXNlIGZpeGVkIGNlbGxz
IGZyb20gbm93IG9uLiBJbiBib3RoIGNhc2VzIHlvdSBleHRyYWN0IGNlbGxzIGZyb20KPiBmaXhl
ZCBPRiBub2RlcyBidXQgdGhpcyBib29sZWFuIG5lZWRzIHRvIGJlIHNldCB0byB0cnVlIGluIG9u
ZQo+IGNhc2UsIGFuZCBmYWxzZSBpbiB0aGUgb3RoZXIsIHdoaWNoIHdvdWxkIG5vdCBtYWtlIHNl
bnNlLgo+IAo+IEFsc28sIHJlZ2FyZGluZyB0aGUgYmluZGluZ3MgY2hhbmdlcywgSSdtIGZhaXJs
eSBoYXBweSB3aXRoIHRoZSBpZGVhLAo+IGJ1dCBpZiB3ZSBnbyB0aGlzIHdheSBJIHdvdWxkIHBy
ZWZlciBhIGZ1bGwgc2VyaWVzIGluc3RlYWQgb2YKPiBpbmRpdmlkdWFsIGNoYW5nZXMgd2l0aDoK
PiAKPiAtIHRoZSBib29sZWFuIHlvdSBpbnRyb2R1Y2UgaGVyZSAocmVuYW1lZCwgYXQgdGhlIHZl
cnkgbGVhc3QpCj4gLSB0aGUgbmV3IGJpbmRpbmdzCgpJIGFzc3VtZSB5b3UgbWVhbiBmaXhlZC1s
YXlvdXQueWFtbD8KCgo+IC0gdGhlIHVwZGF0ZSBvZiB0aGUgY3VycmVudCBwcm92aWRlciBiaW5k
aW5ncyB0byB0YWtlIHRoZSBuZXcgYmluZGluZ3MKPiAgICBpbnRvIGFjY291bnQgYW5kIGRlcHJl
Y2F0ZSB0aGUgb2xkIG9uZXMgb2ZmaWNpYWxseQoKV2hhdCBoYXMgdG8gYmUgdXBkYXRlZCBpbiBj
dXJyZW50IHByb2NlZHM/IEl0IHNlZW1zIHRvIG1lIHRoYXQ6CjEuIEN1cnJlbnQgTlZNRU0gcHJv
dmlkZXJzIHJlZmVyZW5jZSBudm1lbS55YW1sCjIuIG52bWVtLnlhbWwgcmVmZXJlbmNlcyBudm1l
bS1sYXlvdXQueWFtbAozLiBudm1lbS1sYXlvdXQueWFtbCByZWZlcmVuY2VzIGZpeGVkLWxheW91
dC55YW1sCgp3aGF0IGVsc2UgaXMgbWlzc2luZz8KCgo+IC0gc3VwcG9ydCBmb3IgdGhlIG5ldyBi
aW5kaW5ncyBpbiB0aGUgY29yZQoKUGxlYXNlLCBkb24ndCBnZXQgbWUgd3JvbmcsIGJ1dCBJJ20g
bm90IGdvaW5nIHRvIHNwZW5kIG1vcmUgaG91cnMgb24KYWN0dWFsIGNvZGluZyB3aXRob3V0IGFw
cHJvdmFsIG9mIGNob3NlbiBwYXRoLgoKSSdsbCBuZWVkIHRvIGhhdmUKW1BBVENIIFYyXSBkdC1i
aW5kaW5nczogbnZtZW06IGxheW91dHM6IGFkZCBmaXhlZC1sYXlvdXQKcmV2aWV3ZWQvYWNrZWQg
Zmlyc3QuIElmIHlvdSBjYW4gZG8gdGhhdCB0aGF0J3MgZ3JlYXQuCgoKPj4gICAgKiBAa2VlcG91
dDoJT3B0aW9uYWwgYXJyYXkgb2Yga2VlcG91dCByYW5nZXMgKHNvcnRlZCBhc2NlbmRpbmcgYnkg
c3RhcnQpLgo+PiAgICAqIEBua2VlcG91dDoJTnVtYmVyIG9mIGVsZW1lbnRzIGluIHRoZSBrZWVw
b3V0IGFycmF5Lgo+PiAgICAqIEB0eXBlOglUeXBlIG9mIHRoZSBudm1lbSBzdG9yYWdlCj4+IEBA
IC0xMDMsNiArMTA0LDcgQEAgc3RydWN0IG52bWVtX2NvbmZpZyB7Cj4+ICAgCXN0cnVjdCBtb2R1
bGUJCSpvd25lcjsKPj4gICAJY29uc3Qgc3RydWN0IG52bWVtX2NlbGxfaW5mbwkqY2VsbHM7Cj4+
ICAgCWludAkJCW5jZWxsczsKPj4gKwlib29sCQkJdXNlX2ZpeGVkX29mX2NlbGxzOwo+PiAgIAlj
b25zdCBzdHJ1Y3QgbnZtZW1fa2VlcG91dCAqa2VlcG91dDsKPj4gICAJdW5zaWduZWQgaW50CQlu
a2VlcG91dDsKPj4gICAJZW51bSBudm1lbV90eXBlCQl0eXBlOwo+IAo+IFRoYW5rcywKPiBNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
