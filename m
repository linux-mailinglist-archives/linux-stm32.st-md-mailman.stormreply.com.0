Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C6166DA21
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Jan 2023 10:41:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CC93C65E45;
	Tue, 17 Jan 2023 09:41:21 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C362FC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 09:41:19 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id pa22so15811842qkn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 01:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdQxBMQOMwqD8VUok85rROkSgj2htMeyYzI/9JQJnaY=;
 b=HdpUBrzVC+fRm5us0I5pcSVClglYaFUfiEm/cGmO0HRwQ+aYU0HVym6Sa1QAveTfcy
 HVrNoblnZL7c17Uzkx9cWtDUNfb/se9p1L8E0LImXSu+eOf5/sphsIlfsbxsZUBcSG3A
 epLckHWQLqK9BHTP8K/H2nWLrxRMmIziEGtmrfzMCzTlKxaNHqt+yQ5uevBzAlX/9/dD
 eraOfE2nSwKxtnVs7ghhKhl4PJs4QjHGI2ViGL60UKvVQ0h5+wkTdiujQa4bIuASu3/g
 mGE/ZB8GT3isx1sHuKZF2MZCBZI+i9AXRO9tTxFkQbgjJOCiiAphcf9gB63ctNnSGHL5
 ktCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hdQxBMQOMwqD8VUok85rROkSgj2htMeyYzI/9JQJnaY=;
 b=Pbe5bag9yHPG0E/T/9MNPX5lznMToeMprH8CZpkopTzDfjnOJhTRxicoZLUYU7VDof
 5htZfLZElrnyFe/2xGtWlU/UzBWMVsyIqJNrOb/4jfJYf9WO5DIE77r8xWsB/PpuhhHi
 Xec5GjNqUYZWfa9BOVReAku/eAkjN+y/B/pH5yWFUS60H9mXLTuzl9kl1QHAozjFrzh3
 Nau1DH6I982vWxRH9sEVU3sSajla9OfovvMf8xpdhBXHG5OeEyWkkrEqrjBgkZhNlwFx
 0rjnwjYxomGapFu0rFNaKfOliT3hSEkNAqF4YDZ1fhZn0ItYABQBsChsnjxfcvw2Kp+n
 v35g==
X-Gm-Message-State: AFqh2kog2v0Yrgjf7sliLtLlzbMdK/wSDXXjqdgcVdCN2cxEsAwFBL30
 aLw6GANaZ8Yz9f/1X3sD8Y18g4s2noTbe5PRHkI=
X-Google-Smtp-Source: AMrXdXvUweQfxPG9XW/trbF8uyUaDAKToxBAJ8l2RD/emKWwnVOskao8jQNpBm7SRN0AryYBpZ/goUm0u7jIv/pAfEY=
X-Received: by 2002:a05:620a:36f4:b0:702:34dc:25a8 with SMTP id
 cz52-20020a05620a36f400b0070234dc25a8mr95984qkb.748.1673948478628; Tue, 17
 Jan 2023 01:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-13-nuno.sa@analog.com>
 <20220806192048.0ca41cc5@jic23-huawei>
 <20230116204452.il4gase2szipeexz@SoMainline.org>
 <CAHp75VdX9sFgn9STyzwcDCK1KYbU00ejFNcEP3FVnLk5J=Pktg@mail.gmail.com>
 <CAHp75VdTftm1BE21rH1HVHiwUye-0Dvc66uCK2LE2qF4_zA6hg@mail.gmail.com>
In-Reply-To: <CAHp75VdTftm1BE21rH1HVHiwUye-0Dvc66uCK2LE2qF4_zA6hg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jan 2023 11:40:42 +0200
Message-ID: <CAHp75VdyCA7mQdm--kg=hUbmQqX4-jfFMHgLxref5mNSM1vnMA@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, linux-iio@vger.kernel.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 Lars-Peter Clausen <lars@metafoo.de>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Haibo Chen <haibo.chen@nxp.com>,
 linux-imx@nxp.com, Tali Perry <tali.perry1@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 12/15] iio: adc: qcom-spmi-adc5:
	convert to device properties
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

T24gVHVlLCBKYW4gMTcsIDIwMjMgYXQgMTE6MDYgQU0gQW5keSBTaGV2Y2hlbmtvCjxhbmR5LnNo
ZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSmFuIDE3LCAyMDIzIGF0IDEw
OjUzIEFNIEFuZHkgU2hldmNoZW5rbwo+IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3cm90
ZToKPiA+Cj4gPiBPbiBNb24sIEphbiAxNiwgMjAyMyBhdCAxMDo0NCBQTSBNYXJpam4gU3VpanRl
bgo+ID4gPG1hcmlqbi5zdWlqdGVuQHNvbWFpbmxpbmUub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gMjAyMi0wOC0wNiAxOToyMDo0OCwgSm9uYXRoYW4gQ2FtZXJvbiB3cm90ZToKPiA+ID4gPiBP
biBGcmksIDE1IEp1bCAyMDIyIDE0OjI5OjAwICswMjAwCj4gPiA+ID4gTnVubyBTw6EgPG51bm8u
c2FAYW5hbG9nLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+IE1ha2UgdGhlIGNvbnZlcnNp
b24gdG8gZmlybXdhcmUgYWdub3N0aWMgZGV2aWNlIHByb3BlcnRpZXMuIEFzIHBhcnQgb2YKPiA+
ID4gPiA+IHRoZSBjb252ZXJzaW9uIHRoZSBJSU8gaW5rZXJuIGludGVyZmFjZSAnb2ZfeGxhdGUo
KScgaXMgYWxzbyBjb252ZXJ0ZWQgdG8KPiA+ID4gPiA+ICdmd25vZGVfeGxhdGUoKScuIFRoZSBn
b2FsIGlzIHRvIGNvbXBsZXRlbHkgZHJvcCAnb2ZfeGxhdGUnIGFuZCBoZW5jZSBPRgo+ID4gPiA+
ID4gZGVwZW5kZW5jaWVzIGZyb20gSUlPLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+Cj4gPiA+ID4gPiBBY2tlZC1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+ID4gPiA+ID4gUmV2aWV3ZWQt
Ynk6IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4KPiA+ID4gPiAr
Q0MgTWFyaWppbiB3aG8gaGFwcGVuZCB0byBwb3N0IGEgcGF0Y2ggZm9yIHRoaXMgZHJpdmVyIHRo
YXQgSSBqdXN0IGFjY2VwdGVkCj4gPiA+ID4gYW5kIGhlbmNlIHByb2JhYmx5IGhhcyBoYXJkd2Fy
ZSBhY2Nlc3MuICBBbnkgY2hhbmNlIG9mIGEgdGVzdCBmb3IgdGhpcyBzZXJpZXM/Cj4gPiA+ID4K
PiA+ID4gPiBJZiBub3QsIG5vIHByb2JsZW0gYXMgdGhpcyBpcyBmYWlybHkgbWVjaGFuaWNhbCBh
bmQgd2UgaGF2ZSB0ZXN0aW5nIG9uIHNvbWUgb2YKPiA+ID4gPiB0aGUgb3RoZXIgZHJpdmVycyB1
c2luZyB0aGUgbmV3IGNvZGUuCj4gPiA+ID4KPiA+ID4gPiBJJ2xsIHByb2JhYmx5IHF1ZXVlIHRo
aXMgdXAgaW4gdGhlIG1lYW50aW1lIGJ1dCBpdCB3b24ndCBlbmQgdXAgdXBzdHJlYW0KPiA+ID4g
PiBmb3IgYSBmZXcgd2Vla3MgeWV0Lgo+ID4gPgo+ID4gPiBKb25hdGhhbiwKPiA+ID4KPiA+ID4g
VGhpcyBDQyBqdXN0IHN1cmZhY2VkIGluIG15IGluYm94IHdoaWxlIHNlYXJjaGluZyBmb3Igb3Vy
IGN1cnJlbnQKPiA+ID4gZGlzY3Vzc2lvbiBhcm91bmQgbWlzc2luZyBsYWJlbHMgaW4gcWNvbS1z
cG1pLXZhZGMgLSBhbmQgb24gdGhlIHNpZGUgYQo+ID4gPiB1c2Vyc3BhY2UgQHh4IGxhYmVsIG5h
bWUgQUJJIGJyZWFrIChpbiBxY29tLXNwbWktYWRjNSkgY2F1c2VkIGJ5IHRoaXMKPiA+ID4gcGF0
Y2gncyBmd25vZGVfZ2V0X25hbWUgY2hhbmdlIC0gd2UgY291bGQndmUgY2F1Z2h0IGl0IGlmIEkg
aGFkIG5vdAo+ID4gPiBhY2NpZGVudGFsbHkgbWFya2VkIGl0IGFzIHJlYWQgYW5kL29yIGZvcmdv
dCBhYm91dCBpdC4gIE15IGFwb2xvZ2llcy4KPiA+Cj4gPiBEb2VzIHRoZSBmb2xsb3dpbmcgYWRk
aXRpb24gdG8gdGhlIHRvcCBvZiB0aGUKPiA+IGFkYzVfZ2V0X2Z3X2NoYW5uZWxfZGF0YSgpIGZp
eCB0aGUgaXNzdWU/Cj4gPgo+ID4gKyAgICAgICBuYW1lID0gZGV2bV9rYXNwcmludGYoYWRjLT5k
ZXYsIEdGUF9LRVJORUwsICIlcGZ3UCIsIGZ3bm9kZSk7Cj4gPiArICAgICAgIGlmICghbmFtZSkK
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPgo+IE9rYXksIGl0IHByb2JhYmx5
IHRoZSBzYW1lLCBzbyBpdCBtaWdodCBuZWVkIGFkZGl0aW9uYWwgY29kZSB0bwo+Cj4gKyBuYW1l
W3N0cmNocm51bChuYW1lLCAnQCcpIC0gbmFtZV0gPSAnXDAnOwoKSSBoYXZlIGp1c3Qgc2VudCBh
IGZvcm1hbCBwYXRjaCwgcGxlYXNlIHRlc3Qgb24gdG9wIG9mIG5vbi13b3JraW5nIGtlcm5lbC4K
CgotLQpXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
