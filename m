Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC93019F0C9
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 09:31:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D290C36B0B;
	Mon,  6 Apr 2020 07:31:59 +0000 (UTC)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81579C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 07:31:57 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id f9so5121364uaq.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Apr 2020 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=verdurent-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tcs7bP7KM3PIrqJj8Hr62xEaLUtpUiqXHCb5QGQNylU=;
 b=ZCcu5A0KQmWcU5bmi1Kqt/A4CTZcApoKg1CWiTOY8Af2dGNzNsxP8p8+fKa51kPrDM
 EDDUiuqvatgTpoShc8v9N2Gg5evZH3A6p113f+M5sOsipWZyw8DVkpPke9TirEnhEK3/
 BvvpBtUzZzT7KVcfeGZ5iPAlfgZp37ksnF3PrPsyZNRYGxRIQP6ZUM1XDVTy7AFbRJko
 e0bXtLQdjoj8nkutSU9/f7TVQEiS9UlLIMr6iGhKq5kFDItQvVAeVslZ9HzbgjDUXebb
 pFyPedZGOBwLIkJU9yaYXI2YRuF3xLDjh6JTNqRWgA8ls/bCHHF0b6L4vVXhQfEyGXK9
 xx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tcs7bP7KM3PIrqJj8Hr62xEaLUtpUiqXHCb5QGQNylU=;
 b=Z8B0K8ebhB/91BrqLMtDA/mIdfnwpi0n3+PoPKiKJr//9UpfLzqZDHEgdPaX0mTxuf
 fZqBdhfK42eaNm7N9sTkIqkhzqwsunNueyUmRHoQ5qICrDCa5f7M4cLdVphVe+8bXR8H
 TQO1nWTE3kOupJWXXNEhrvJY/qZiYGHCX3J8P+A3Xnu0YTFAcRylovIKRaEYgxtsencq
 UoFAzRL3CyYmy8DDnx999Q7OLCN4RD/WfMqymtUZI0oqMhp6VQrDhEiPs4of8+ElJUbE
 HN5RLWlO/YZWWO0cysfl0Rafjq9csJpoqBprHJweQVNtt7Lvifjn4EsJLuAYVA6klMBF
 o8Tw==
X-Gm-Message-State: AGi0PuY0bsmMfCRpHNDZ3fVan+EzJxJWT80v9A3KGHLww81VO87FUbwa
 PvtnG1EE4I1I93vb0MeqduullxV0eiwCevtmFg+alA==
X-Google-Smtp-Source: APiQypK7NveNncZKcf8ZgGWKN34h9iznOE8Tk+T7PbfZ/mRj5uGhOR3oyEhU0l3b2UqurmrqrqJRVpVI/pXTGwXwNPw=
X-Received: by 2002:ab0:911:: with SMTP id w17mr13564370uag.60.1586158316231; 
 Mon, 06 Apr 2020 00:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <05f49ae7-5cc7-d6a0-fc3d-abaf2a0b373c@web.de>
In-Reply-To: <05f49ae7-5cc7-d6a0-fc3d-abaf2a0b373c@web.de>
From: Amit Kucheria <amit.kucheria@verdurent.com>
Date: Mon, 6 Apr 2020 13:00:00 +0530
Message-ID: <CAHLCerMS5ghVXhOD7RAd5unxEe7w1W4_8hBP5Tf9HvuMEh5Lqg@mail.gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Clark Williams <williams@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 kernel-janitors@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-rockchip@lists.infradead.org,
 lakml <linux-arm-kernel@lists.infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Pascal Paillet <p.paillet@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Allison Randal <allison@lohutok.net>, Tang Bin <tangbin@cmss.chinamobile.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [Linux-stm32] [PATCH] thermal: Delete an error message in four
	functions
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

T24gU3VuLCBBcHIgNSwgMjAyMCBhdCAxMDoyMSBQTSBNYXJrdXMgRWxmcmluZyA8TWFya3VzLkVs
ZnJpbmdAd2ViLmRlPiB3cm90ZToKPgo+IEZyb206IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVz
ZXJzLnNvdXJjZWZvcmdlLm5ldD4KPiBEYXRlOiBTdW4sIDUgQXByIDIwMjAgMTg6MzU6MTYgKzAy
MDAKPgo+IFRoZSBmdW5jdGlvbiDigJxwbGF0Zm9ybV9nZXRfaXJx4oCdIGNhbiBsb2cgYW4gZXJy
b3IgYWxyZWFkeS4KPiBUaHVzIG9taXQgcmVkdW5kYW50IG1lc3NhZ2VzIGZvciB0aGUgZXhjZXB0
aW9uIGhhbmRsaW5nIGluIHRoZQo+IGNhbGxpbmcgZnVuY3Rpb25zLgo+Cj4gVGhpcyBpc3N1ZSB3
YXMgZGV0ZWN0ZWQgYnkgdXNpbmcgdGhlIENvY2NpbmVsbGUgc29mdHdhcmUuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+CgpS
ZXZpZXdlZC1ieTogQW1pdCBLdWNoZXJpYSA8YW1pdC5rdWNoZXJpYUBsaW5hcm8ub3JnPgoKPiAt
LS0KPiAgZHJpdmVycy90aGVybWFsL3JvY2tjaGlwX3RoZXJtYWwuYyAgICAgICAgICB8IDQgKy0t
LQo+ICBkcml2ZXJzL3RoZXJtYWwvc3Qvc3RfdGhlcm1hbF9tZW1tYXAuYyAgICAgIHwgNCArLS0t
Cj4gIGRyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1hbC5jICAgICAgICAgICAgfCA0ICstLS0K
PiAgZHJpdmVycy90aGVybWFsL3RpLXNvYy10aGVybWFsL3RpLWJhbmRnYXAuYyB8IDUgKystLS0K
PiAgNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGhlcm1hbC9yb2NrY2hpcF90aGVybWFsLmMgYi9kcml2ZXJz
L3RoZXJtYWwvcm9ja2NoaXBfdGhlcm1hbC5jCj4gaW5kZXggN2MxYThiY2NkY2JhLi4xNWE3MWVj
YzkxNmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy90aGVybWFsL3JvY2tjaGlwX3RoZXJtYWwuYwo+
ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC9yb2NrY2hpcF90aGVybWFsLmMKPiBAQCAtMTI0MSwxMCAr
MTI0MSw4IEBAIHN0YXRpYyBpbnQgcm9ja2NoaXBfdGhlcm1hbF9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOWElPOwo+Cj4gICAg
ICAgICBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+IC0gICAgICAgaWYgKGlycSA8
IDApIHsKPiAtICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAibm8gaXJxIHJlc291
cmNlP1xuIik7Cj4gKyAgICAgICBpZiAoaXJxIDwgMCkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gLSAgICAgICB9Cj4KPiAgICAgICAgIHRoZXJtYWwgPSBkZXZtX2t6YWxsb2Mo
JnBkZXYtPmRldiwgc2l6ZW9mKHN0cnVjdCByb2NrY2hpcF90aGVybWFsX2RhdGEpLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMKTsKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy90aGVybWFsL3N0L3N0X3RoZXJtYWxfbWVtbWFwLmMgYi9kcml2ZXJzL3RoZXJtYWwvc3Qv
c3RfdGhlcm1hbF9tZW1tYXAuYwo+IGluZGV4IGE4MjRiNzhkYWJmOC4uYTAxMTQ0NTJkMTFmIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvdGhlcm1hbC9zdC9zdF90aGVybWFsX21lbW1hcC5jCj4gKysr
IGIvZHJpdmVycy90aGVybWFsL3N0L3N0X3RoZXJtYWxfbWVtbWFwLmMKPiBAQCAtOTQsMTAgKzk0
LDggQEAgc3RhdGljIGludCBzdF9tbWFwX3JlZ2lzdGVyX2VuYWJsZV9pcnEoc3RydWN0IHN0X3Ro
ZXJtYWxfc2Vuc29yICpzZW5zb3IpCj4gICAgICAgICBpbnQgcmV0Owo+Cj4gICAgICAgICBzZW5z
b3ItPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gLSAgICAgICBpZiAoc2Vuc29y
LT5pcnEgPCAwKSB7Cj4gLSAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJl
Z2lzdGVyIElSUVxuIik7Cj4gKyAgICAgICBpZiAoc2Vuc29yLT5pcnEgPCAwKQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gc2Vuc29yLT5pcnE7Cj4gLSAgICAgICB9Cj4KPiAgICAgICAgIHJldCA9
IGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoZGV2LCBzZW5zb3ItPmlycSwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwgc3RfbW1hcF90aGVybWFsX3RyaXBf
aGFuZGxlciwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVybWFsL3N0L3N0bV90aGVybWFsLmMg
Yi9kcml2ZXJzL3RoZXJtYWwvc3Qvc3RtX3RoZXJtYWwuYwo+IGluZGV4IDkzMTRlM2RmNmE0Mi4u
MzMxZTJiNzY4ZGY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1h
bC5jCj4gKysrIGIvZHJpdmVycy90aGVybWFsL3N0L3N0bV90aGVybWFsLmMKPiBAQCAtMzg1LDEw
ICszODUsOCBAQCBzdGF0aWMgaW50IHN0bV9yZWdpc3Rlcl9pcnEoc3RydWN0IHN0bV90aGVybWFs
X3NlbnNvciAqc2Vuc29yKQo+ICAgICAgICAgaW50IHJldDsKPgo+ICAgICAgICAgc2Vuc29yLT5p
cnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+IC0gICAgICAgaWYgKHNlbnNvci0+aXJx
IDwgMCkgewo+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIiVzOiBVbmFibGUgdG8gZmlu
ZCBJUlFcbiIsIF9fZnVuY19fKTsKPiArICAgICAgIGlmIChzZW5zb3ItPmlycSA8IDApCj4gICAg
ICAgICAgICAgICAgIHJldHVybiBzZW5zb3ItPmlycTsKPiAtICAgICAgIH0KPgo+ICAgICAgICAg
cmV0ID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycShkZXYsIHNlbnNvci0+aXJxLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3RoZXJtYWwvdGktc29jLXRoZXJtYWwvdGktYmFuZGdhcC5jIGIvZHJpdmVycy90aGVy
bWFsL3RpLXNvYy10aGVybWFsL3RpLWJhbmRnYXAuYwo+IGluZGV4IDI2M2IwNDIwZmJlNC4uYWIx
OWNlZmY2ZTJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdGhlcm1hbC90aS1zb2MtdGhlcm1hbC90
aS1iYW5kZ2FwLmMKPiArKysgYi9kcml2ZXJzL3RoZXJtYWwvdGktc29jLXRoZXJtYWwvdGktYmFu
ZGdhcC5jCj4gQEAgLTc3MiwxMCArNzcyLDkgQEAgc3RhdGljIGludCB0aV9iYW5kZ2FwX3RhbGVy
dF9pbml0KHN0cnVjdCB0aV9iYW5kZ2FwICpiZ3AsCj4gICAgICAgICBpbnQgcmV0Owo+Cj4gICAg
ICAgICBiZ3AtPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gLSAgICAgICBpZiAo
YmdwLT5pcnEgPCAwKSB7Cj4gLSAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgImdl
dF9pcnEgZmFpbGVkXG4iKTsKPiArICAgICAgIGlmIChiZ3AtPmlycSA8IDApCj4gICAgICAgICAg
ICAgICAgIHJldHVybiBiZ3AtPmlycTsKPiAtICAgICAgIH0KPiArCj4gICAgICAgICByZXQgPSBy
ZXF1ZXN0X3RocmVhZGVkX2lycShiZ3AtPmlycSwgTlVMTCwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHRpX2JhbmRnYXBfdGFsZXJ0X2lycV9oYW5kbGVyLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgSVJRRl9UUklHR0VSX0hJR0ggfCBJUlFGX09ORVNI
T1QsCj4gLS0KPiAyLjI2LjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
