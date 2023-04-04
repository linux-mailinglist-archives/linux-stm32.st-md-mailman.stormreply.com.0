Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DCF6D699F
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 18:57:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8336CC6A603;
	Tue,  4 Apr 2023 16:57:19 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1112C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 16:57:17 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id i5so133503008eda.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 09:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680627437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P7MhNZCWbmm+EQT2ZpLl2E/34gvDoi8JcsBYxfVZFwk=;
 b=VpLHIMinqDrwBgJCKe6aTCq+o2ToI2AcQwk7ETuH985y5l712JB/Jr1vrwVpie63AZ
 nP362aTfXVOwRwLlXpHGRk4PBTdeD94ijJ3+RUp1P9nqBBAXEX3pLLPbG+6Inwk7Uyaj
 uFjOnX4OGtjx8sYfx5vR29bO11rfY1Hsi6htfgOa7JqSh39Nv9chkha/eSesvzGdBXYu
 bpqi5ctpHBfKsmoMkLOHfPG+HXDlIrDf4yTtLRYMdJ/ZFlrEERZIjqkBnEZBJXKN5zvv
 6tBj4cl/oiz+AS47+YvLvIi9B3cokqy7sBMFOpBtuySkQHlO05Xw1iJ2uLy3r//bUthI
 cYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680627437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P7MhNZCWbmm+EQT2ZpLl2E/34gvDoi8JcsBYxfVZFwk=;
 b=OmxEfCuD/POD3mMjYICaw6Lifrvpu9jAnTV+taeyuYVdrjwYYOBMGZK7Yo3uoA7hPS
 3GblU5rzpHArIF/rDH2/YhXxTn6bDJmk76RpDD2IDBqp112onVdw11fR9dB8HBRKC15a
 gcM/K0J2x5Xv/S1woMbvlZ6lIZeaDYVMAhwLJPFENsNbMBJqKts3m7pwKkyf8Uzc7Qmi
 WW0awzLyken8lUi597N8D5IiIfWM4spNMkbebYO2Vwz545Qyx5SD/poEaDwjx02nD2mo
 UpcoWYypiJXnJUZkB38DNues4Rx9kzMSFjquudpAEyTVNVCURKhaz6CeYE+Zg/xGiZki
 q55A==
X-Gm-Message-State: AAQBX9c27j1N4jYZiZ6E8g475zA/V+FCjoz7LWqelkRLmFII/TTRyJBw
 401ymRZ1LrN8vgYBIOyFYlI=
X-Google-Smtp-Source: AKy350aLVwwKqFdLN/chhOt48r5LY4guvRxpRxIkNFsLEqvsNQmQtpD22vmnvW+Hx6srEDa7zCZz5g==
X-Received: by 2002:aa7:d514:0:b0:4fb:6523:2b38 with SMTP id
 y20-20020aa7d514000000b004fb65232b38mr156531edq.27.1680627437154; 
 Tue, 04 Apr 2023 09:57:17 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233]) by smtp.gmail.com with ESMTPSA id
 e27-20020a50d4db000000b004fadc041e13sm6144420edj.42.2023.04.04.09.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 09:57:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Tue, 04 Apr 2023 18:57:14 +0200
Message-ID: <4817385.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230403225540.1931-1-zajec5@gmail.com>
References: <20230403225540.1931-1-zajec5@gmail.com>
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Evgeniy Polyakov <zbr@ioremap.net>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Richard Weinberger <richard@nod.at>, Michal Simek <michal.simek@xilinx.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Vincent Shih <vincent.sunplus@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sven Peter <sven@svenpeter.dev>,
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
Subject: [Linux-stm32] Re: [PATCH V4] nvmem: add explicit config option to
 read old syntax fixed OF cells
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

RG5lIHRvcmVrLCAwNC4gYXByaWwgMjAyMyBvYiAwMDo1NTo0MCBDRVNUIGplIFJhZmHFgiBNacWC
ZWNraSBuYXBpc2FsKGEpOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5w
bD4KPiAKPiBCaW5kaW5nIGZvciBmaXhlZCBOVk1FTSBjZWxscyBkZWZpbmVkIGRpcmVjdGx5IGFz
IE5WTUVNIGRldmljZSBzdWJub2Rlcwo+IGhhcyBiZWVuIGRlcHJlY2F0ZWQuIEl0IGhhcyBiZWVu
IHJlcGxhY2VkIGJ5IHRoZSAiZml4ZWQtbGF5b3V0IiBOVk1FTQo+IGxheW91dCBiaW5kaW5nLgo+
IAo+IE5ldyBzeW50YXggaXMgbWVhbnQgdG8gYmUgY2xlYXJlciBhbmQgc2hvdWxkIGhlbHAgYXZv
aWRpbmcgaW1wcmVjaXNlCj4gYmluZGluZ3MuCj4gCj4gTlZNRU0gc3Vic3lzdGVtIGFscmVhZHkg
c3VwcG9ydHMgdGhlIG5ldyBiaW5kaW5nLiBJdCBzaG91bGQgYmUgYSBnb29kCj4gaWRlYSB0byBs
aW1pdCBzdXBwb3J0IGZvciBvbGQgc3ludGF4IHRvIGV4aXN0aW5nIGRyaXZlcnMgdGhhdCBhY3R1
YWxseQo+IHN1cHBvcnQgJiB1c2UgaXQgKHdlIGNhbid0IGJyZWFrIGJhY2t3YXJkIGNvbXBhdGli
aWxpdHkhKS4gVGhhdCB3YXkgd2UKPiBhZGRpdGlvbmFsbHkgZW5jb3VyYWdlIG5ldyBiaW5kaW5n
cyAmIGRyaXZlcnMgdG8gaWdub3JlIGRlcHJlY2F0ZWQKPiBiaW5kaW5nLgo+IAo+IEl0IHdhc24n
dCBjbGVhciAodG8gbWUpIGlmIHJ0YyBhbmQgdzEgY29kZSBhY3R1YWxseSB1c2VzIG9sZCBzeW50
YXgKPiBmaXhlZCBjZWxscy4gSSBlbmFibGVkIHRoZW0gdG8gZG9uJ3QgcmlzayBhbnkgYnJlYWth
Z2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBs
Pgo+IFtmb3IgbWVzb24te2VmdXNlLG14LWVmdXNlfS5jXQo+IEFja2VkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IFtmb3IgbXRr
LWVmdXNlLmMsIG52bWVtL2NvcmUuYywgbnZtZW0tcHJvdmlkZXIuaF0KPiBSZXZpZXdlZC1ieTog
QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8KPiA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bj
b2xsYWJvcmEuY29tPiBbTVQ4MTkyLCBNVDgxOTUgQ2hyb21lYm9va3NdCj4gVGVzdGVkLWJ5OiBB
bmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubwo+IDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNv
bGxhYm9yYS5jb20+IFtmb3IgbWljcm9jaGlwLW90cGMuY10KPiBSZXZpZXdlZC1ieTogQ2xhdWRp
dSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+Cj4gW1NBTUE3RzUtRUtdCj4g
VGVzdGVkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT4K
PiAtLS0KPiBUaGlzIGlzIGJhc2VkIG9uIHRvcCBvZiB0aGVtCj4gW1BBVENIIFY2IDMvM10gbnZt
ZW06IGNvcmU6IGFkZCBzdXBwb3J0IGZvciBmaXhlZCBjZWxscyAqbGF5b3V0Kgo+IAo+IFYyOiBG
aXggc3RtMzItcm9tZW0uYyB0eXBvIGJyZWFraW5nIGl0cyBjb21waWxhdGlvbgo+ICAgICBQaWNr
IE1hcnRpbidzIEFja2VkLWJ5Cj4gICAgIEFkZCBwYXJhZ3JhcGggYWJvdXQgbGF5b3V0cyBkZXBy
ZWNhdGluZyBhZGRfbGVnYWN5X2ZpeGVkX29mX2NlbGxzCj4gVjM6IFVwZGF0ZSBjb21taXQgZGVz
Y3JpcHRpb246Cj4gICAgIDEuIE1ha2UgaXQgY2xlYXIgd2UncmUgTk9UIGRyb3BwaW5nIGZpeGVk
IGNlbGxzIHN1cHBvcnQKPiAgICAgMi4gVXNlIG5pY2VyIHdvcmRzIChzL21hZGUgc2Vuc2Uvd2Fz
IHRvdGFsbHkgc2FmZS8pCj4gICAgIDMuIEV4cGxhaW4gZml4ZWQgY2VsbHMgbGF5b3V0IHRoaW5n
Cj4gICAgIDQuIEFkZCBwYXJhZ3JhcGggd2l0aCBwdXJwb3NlIG9mIHRoaXMgY29tbWl0Cj4gVjQ6
IENvbXBsZXRlbHkgcmV3cml0ZSBjb21taXQgbWVzc2FnZS4KPiAgICAgUmVuYW1lIGNvbmZpZyBv
cHRpb24gdG8gImFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMiLgo+IC0tLQo+ICBkcml2ZXJzL210
ZC9tdGRjb3JlLmMgICAgICAgICAgfCAyICsrCj4gIGRyaXZlcnMvbnZtZW0vYXBwbGUtZWZ1c2Vz
LmMgICB8IDEgKwo+ICBkcml2ZXJzL252bWVtL2NvcmUuYyAgICAgICAgICAgfCA4ICsrKysrLS0t
Cj4gIGRyaXZlcnMvbnZtZW0vaW14LW9jb3RwLXNjdS5jICB8IDEgKwo+ICBkcml2ZXJzL252bWVt
L2lteC1vY290cC5jICAgICAgfCAxICsKPiAgZHJpdmVycy9udm1lbS9tZXNvbi1lZnVzZS5jICAg
IHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vbWVzb24tbXgtZWZ1c2UuYyB8IDEgKwo+ICBkcml2ZXJz
L252bWVtL21pY3JvY2hpcC1vdHBjLmMgfCAxICsKPiAgZHJpdmVycy9udm1lbS9tdGstZWZ1c2Uu
YyAgICAgIHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vcWNvbS1zcG1pLXNkYW0uYyB8IDEgKwo+ICBk
cml2ZXJzL252bWVtL3FmcHJvbS5jICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9udm1lbS9yYXZl
LXNwLWVlcHJvbS5jIHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vcm9ja2NoaXAtZWZ1c2UuYyB8IDEg
Kwo+ICBkcml2ZXJzL252bWVtL3NjMjd4eC1lZnVzZS5jICAgfCAxICsKPiAgZHJpdmVycy9udm1l
bS9zcHJkLWVmdXNlLmMgICAgIHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vc3RtMzItcm9tZW0uYyAg
ICB8IDEgKwo+ICBkcml2ZXJzL252bWVtL3N1bnBsdXMtb2NvdHAuYyAgfCAxICsKPiAgZHJpdmVy
cy9udm1lbS9zdW54aV9zaWQuYyAgICAgIHwgMSArCgpGb3Igc3VueGlfc2lkOgpBY2tlZC1ieTog
SmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4KCkJlc3QgcmVnYXJkcywK
SmVybmVqCgo+ICBkcml2ZXJzL252bWVtL3VuaXBoaWVyLWVmdXNlLmMgfCAxICsKPiAgZHJpdmVy
cy9udm1lbS96eW5xbXBfbnZtZW0uYyAgIHwgMSArCj4gIGRyaXZlcnMvcnRjL252bWVtLmMgICAg
ICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL3cxL3NsYXZlcy93MV9kczI1MHguYyAgfCAxICsKPiAg
aW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oIHwgMiArKwo+ICAyMyBmaWxlcyBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
