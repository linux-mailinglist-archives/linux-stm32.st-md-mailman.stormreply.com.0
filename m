Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 222B38A69B2
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 13:36:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB88BC6B45B;
	Tue, 16 Apr 2024 11:36:24 +0000 (UTC)
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFC00C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 11:30:08 +0000 (UTC)
Received: from [192.168.4.14] (unknown [62.77.71.229])
 by mx.gpxsee.org (Postfix) with ESMTPSA id 9583E3B254;
 Tue, 16 Apr 2024 13:30:06 +0200 (CEST)
Message-ID: <0bea915c-ddad-44b6-ade1-187307da504b@gpxsee.org>
Date: Tue, 16 Apr 2024 13:30:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-1-477afb23728b@chromium.org>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <20240415-fix-cocci-v1-1-477afb23728b@chromium.org>
X-Mailman-Approved-At: Tue, 16 Apr 2024 11:36:23 +0000
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 01/35] media: pci: mgb4: Refactor struct
	resources
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

T24gMTUuIDA0LiAyNCAyMTozNCwgUmljYXJkbyBSaWJhbGRhIHdyb3RlOgo+IFRoZSBzdHJ1Y3Qg
cmVzb3VyY2UgZW5kIGZpZWxkIGlzIGluY2x1c2l2ZSBub3QgZXhjbHVzaXZlLCB0aGlzIGlzLCB0
aGUKPiBzaXplIGlzIChlbmQgLSBzdGFydCkgKzEuCj4gCj4gVXBkYXRlIHRoZSBkZWZpbml0aW9u
cyBhbmQgdXNlIHRoZSBnZW5lcmljIHJlc291cmNlX3NpemUoKSBmdW5jdGlvbi4KPiAKPiBGaXhl
cyBjb2NjaSBjaGVjazoKPiBkcml2ZXJzL21lZGlhL3BjaS9tZ2I0L21nYjRfcmVncy5jOjEzOjIy
LTI1OiBXQVJOSU5HOiBTdXNwaWNpb3VzIGNvZGUuIHJlc291cmNlX3NpemUgaXMgbWF5YmUgbWlz
c2luZyB3aXRoIHJlcwo+IAo+IFNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gUmliYWxkYSA8cmliYWxk
YUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gICBkcml2ZXJzL21lZGlhL3BjaS9tZ2I0L21nYjRfY29y
ZS5jIHwgNCArKy0tCj4gICBkcml2ZXJzL21lZGlhL3BjaS9tZ2I0L21nYjRfcmVncy5jIHwgMiAr
LQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGNpL21nYjQvbWdiNF9jb3JlLmMgYi9kcml2
ZXJzL21lZGlhL3BjaS9tZ2I0L21nYjRfY29yZS5jCj4gaW5kZXggOWJjZjEwYTc3ZmQzLi42MDQ5
OGE1YWJlYmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wY2kvbWdiNC9tZ2I0X2NvcmUu
Ywo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGNpL21nYjQvbWdiNF9jb3JlLmMKPiBAQCAtNDkzLDEz
ICs0OTMsMTMgQEAgc3RhdGljIGludCBtZ2I0X3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBj
b25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCj4gICAJc3RydWN0IG1nYjRfZGV2ICptZ2Jk
ZXY7Cj4gICAJc3RydWN0IHJlc291cmNlIHZpZGVvID0gewo+ICAgCQkuc3RhcnQJPSAweDAsCj4g
LQkJLmVuZAk9IDB4MTAwLAo+ICsJCS5lbmQJPSAweGZmLAo+ICAgCQkuZmxhZ3MJPSBJT1JFU09V
UkNFX01FTSwKPiAgIAkJLm5hbWUJPSAibWdiNC12aWRlbyIsCj4gICAJfTsKPiAgIAlzdHJ1Y3Qg
cmVzb3VyY2UgY210ID0gewo+ICAgCQkuc3RhcnQJPSAweDEwMDAsCj4gLQkJLmVuZAk9IDB4MTgw
MCwKPiArCQkuZW5kCT0gMHgxN2ZmLAo+ICAgCQkuZmxhZ3MJPSBJT1JFU09VUkNFX01FTSwKPiAg
IAkJLm5hbWUJPSAibWdiNC1jbXQiLAo+ICAgCX07Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGNpL21nYjQvbWdiNF9yZWdzLmMgYi9kcml2ZXJzL21lZGlhL3BjaS9tZ2I0L21nYjRfcmVn
cy5jCj4gaW5kZXggNTNkNGU0NTAzYTc0Li4zMWJlZmQ3MjJkNzIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tZWRpYS9wY2kvbWdiNC9tZ2I0X3JlZ3MuYwo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGNp
L21nYjQvbWdiNF9yZWdzLmMKPiBAQCAtMTAsNyArMTAsNyBAQAo+ICAgaW50IG1nYjRfcmVnc19t
YXAoc3RydWN0IHJlc291cmNlICpyZXMsIHN0cnVjdCBtZ2I0X3JlZ3MgKnJlZ3MpCj4gICB7Cj4g
ICAJcmVncy0+bWFwYmFzZSA9IHJlcy0+c3RhcnQ7Cj4gLQlyZWdzLT5tYXBzaXplID0gcmVzLT5l
bmQgLSByZXMtPnN0YXJ0Owo+ICsJcmVncy0+bWFwc2l6ZSA9IHJlc291cmNlX3NpemUocmVzKTsK
PiAgIAo+ICAgCWlmICghcmVxdWVzdF9tZW1fcmVnaW9uKHJlZ3MtPm1hcGJhc2UsIHJlZ3MtPm1h
cHNpemUsIHJlcy0+bmFtZSkpCj4gICAJCXJldHVybiAtRUlOVkFMOwo+IAoKUmV2aWV3ZWQtYnk6
IE1hcnRpbiBUxa9tYSA8bWFydGluLnR1bWFAZGlnaXRlcWF1dG9tb3RpdmUuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
