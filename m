Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED466C0D0A
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:20:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F8E2C6A5EF;
	Mon, 20 Mar 2023 09:20:40 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B899C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:20:39 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1peBgt-0007ye-C4; Mon, 20 Mar 2023 10:20:31 +0100
Message-ID: <8ea65a63-9cb2-8e80-d5ee-429db14be6d1@pengutronix.de>
Date: Mon, 20 Mar 2023 10:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: =?UTF-8?Q?Leonard_G=c3=b6hrs?= <l.goehrs@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230310092650.1007662-1-l.goehrs@pengutronix.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20230310092650.1007662-1-l.goehrs@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v1] ARM: dts: stm32: Add coprocessor
 detach mbox on stm32mp15xx-osd32 SoM
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

T24gMTAuMDMuMjMgMTA6MjYsIExlb25hcmQgR8O2aHJzIHdyb3RlOgo+IFRvIHN1cHBvcnQgdGhl
IGRldGFjaCBmZWF0dXJlLCBhZGQgYSBuZXcgbWFpbGJveCBjaGFubmVsIHRvIGluZm9ybQo+IHRo
ZSByZW1vdGUgcHJvY2Vzc29yIG9uIGEgZGV0YWNoLiBUaGlzIHNpZ25hbCBhbGxvd3MgdGhlIHJl
bW90ZSBwcm9jZXNzb3IKPiBmaXJtd2FyZSB0byBzdG9wIElQQyBjb21tdW5pY2F0aW9uIGFuZCB0
byByZWluaXRpYWxpemUgdGhlIHJlc291cmNlcyBmb3IKPiBhIHJlLWF0dGFjaC4KPiAKPiBTZWUg
NjI1N2RmYzFjNDEyZGNkYmQ3NmNhNWZhOTJjODQ0NDIyMmRiZTViMCBmb3IgYSBwYXRjaCB0aGF0
IGRvZXMgdGhlCj4gc2FtZSBmb3Igc3RtMzJtcDE1eC1ka3ggYm9hcmRzLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IExlb25hcmQgR8O2aHJzIDxsLmdvZWhyc0BwZW5ndXRyb25peC5kZT4KClJldmlld2Vk
LWJ5OiBBaG1hZCBGYXRvdW0gPGEuZmF0b3VtQHBlbmd1dHJvbml4LmRlPgoKVGhhbmtzLApBaG1h
ZAoKPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIuZHRzaSB8IDQg
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1vc2QzMi5kdHNp
IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIuZHRzaQo+IGluZGV4IDkzNWI3
MDg0YjVhMi4uYTQzOTY1Yzg2ZmU4IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMybXAxNXh4LW9zZDMyLmR0c2kKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4
eC1vc2QzMi5kdHNpCj4gQEAgLTIxMCw4ICsyMTAsOCBAQCAmaXBjYyB7Cj4gICZtNF9ycHJvYyB7
Cj4gIAltZW1vcnktcmVnaW9uID0gPCZyZXRyYW0+LCA8Jm1jdXJhbT4sIDwmbWN1cmFtMj4sIDwm
dmRldjB2cmluZzA+LAo+ICAJCQk8JnZkZXYwdnJpbmcxPiwgPCZ2ZGV2MGJ1ZmZlcj47Cj4gLQlt
Ym94ZXMgPSA8JmlwY2MgMD4sIDwmaXBjYyAxPiwgPCZpcGNjIDI+Owo+IC0JbWJveC1uYW1lcyA9
ICJ2cTAiLCAidnExIiwgInNodXRkb3duIjsKPiArCW1ib3hlcyA9IDwmaXBjYyAwPiwgPCZpcGNj
IDE+LCA8JmlwY2MgMj4sIDwmaXBjYyAzPjsKPiArCW1ib3gtbmFtZXMgPSAidnEwIiwgInZxMSIs
ICJzaHV0ZG93biIsICJkZXRhY2giOwo+ICAJaW50ZXJydXB0LXBhcmVudCA9IDwmZXh0aT47Cj4g
IAlpbnRlcnJ1cHRzID0gPDY4IDE+Owo+ICAJc3RhdHVzID0gIm9rYXkiOwo+IAo+IGJhc2UtY29t
bWl0OiBmZTE1YzI2ZWUyNmVmYTExNzQxYTdiNjMyZTlmMjNiMDFhY2E0Y2M2CgotLSAKUGVuZ3V0
cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwg
aHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAg
ICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmlj
aHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkx
Ny01NTU1IHwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
