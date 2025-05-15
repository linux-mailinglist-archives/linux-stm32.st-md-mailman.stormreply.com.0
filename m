Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982EAB84BB
	for <lists+linux-stm32@lfdr.de>; Thu, 15 May 2025 13:26:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8DF9C7A845;
	Thu, 15 May 2025 11:26:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD101C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 11:26:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-442d146a1aaso7530395e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 04:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747308392; x=1747913192;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=E6YcWQUS/krFSoVF5ePsfXGO+e5W0vWFl3MyrWAJnzQ=;
 b=mWEGtT4KmdPk0RMBaYWtgCLT6Rl9fxfrNlqpUDRO/AAg4MfZE/b8ivnMYaf+kyszfL
 pCdSRfb6nuyP9di40Sw4ApESZKYdtcP53CmGfBh/iwgbaKyeqABbMAwMrg/vAAumQX9Y
 mMHuRAl+0/vKoGz4YHro0PMZVTRWImcJV9JwSWQqM3lfMBgx15iBBDrqK+W0ZTGgwSUL
 xaTL63LH5hiNJKWH0KYkdhXkIRgJa6L8yJOTS8vom/S2Rnk8I8YGSBFs1YV+tbKsnvqe
 /gwKlcouKDCiNjfFLE3ztafGlwPKQ/sttUzxKIiGjOkinYx9mNfeHGRvX81gJe+S8OtD
 d63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747308392; x=1747913192;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E6YcWQUS/krFSoVF5ePsfXGO+e5W0vWFl3MyrWAJnzQ=;
 b=neXGVUytEsflznileO7MK2kWLW8VM8SB7HDjnfgtoDaEi1Hpn6yb3Ch7z3vvblcI9l
 0ETsHEVAGeIdhLp6uY72DIdjOttzyXiHtyqqKEyZ+EJpgBiTafwZWu9yTuU44waJVggV
 pzeSwMQ6BSZdt22rvzoc2ug9YI18OVKcWV3H/7wHrNP7KuHd0Kv0Wak5B/STpgrgsMj1
 Rr9/AgOS0lAEnBmZxbsoGCsFS3ZPJajeL7dK2yDiH4uWOyF1XXsWWVMqvh004P5DIVUv
 yOhKuSKVsTcRwwPFw07UFLq+UZ8HzZbEE+XNzW9ZiPIUYV1INrchkxVnwtzi4bbdzHbf
 xlWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnCBFXvSKd++l9mW0rUB7mLOt/Uul3O+O8pqYDcZAZDRSU6TIic7udzds/J8lesfUjncE9QpW+KrfN1g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSkIS8rAX4tkkgcWYWENmqwD6Pz/seEM/CojAEil3iW9FbPTlV
 e5XqrXVyM7y2e9u8cOEJPRMfJBR7g0QTgAL6hNoMUjXJAuW0KZu4O+3gTcyJzA==
X-Gm-Gg: ASbGncuOHzYv3LZmkeyI9prVqGdy1199H3FLEreO/xqYtteGlLRk8zishB8Ot7ma+iG
 0X9Nx6tTGGT3dq7iwzs6GoJ/tp7NXxUcMychNffE0FXuvN0G4sXY2TKDb34yfYDvR6OdJ6jru09
 9R86PIAW9zaIRjJrsefIrJxbSl9pQt2Yj57D1RLvYLYOk8HCIKpdAHKRkvtpX4ofWh7rOkYbA/0
 FB7FI5QxXBy5K/op/2fsJPFzRsaoSc0MAtG6w4XMYDNtlWOwS2lYv9dk5a30jy1Kw8Cscjvp+4g
 e9MI1RJeFvSVNRw7zUZuNTuYaSh1ujGz5vSv62CIxwDTM9YTDl7PHLEqImIYBHQyYFeLsnKp0Wq
 zMkQRChyZNUcEkg==
X-Google-Smtp-Source: AGHT+IEkCceAOB29/pB9CUmVZ8C8Si1ZbNqMfWkWxFcEkinM5zQ7dz5OaP8iyatRAtCIbSSJ7O2kkw==
X-Received: by 2002:a05:600c:3e12:b0:442:dcdc:41c8 with SMTP id
 5b1f17b1804b1-442f96ecf1amr18446915e9.19.1747308392065; 
 Thu, 15 May 2025 04:26:32 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3979355sm67419385e9.37.2025.05.15.04.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 04:26:31 -0700 (PDT)
Date: Thu, 15 May 2025 12:26:27 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <b5x4fayqm242xqm3rgwvrz3jywlixedhhxwo7lft2y3tnuszxr@3oy2kzj2of5l>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-5-christian.bruel@foss.st.com>
 <tdgyva6qyn6qwzvft4f7r3tgp5qswuv4q5swoaeomnnbxtmz5j@zo3gvevx2skp>
 <619756c5-1a61-4aa9-b7fb-6be65175ded2@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <619756c5-1a61-4aa9-b7fb-6be65175ded2@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, thippeswamy.havalige@amd.com,
 linux-kernel@vger.kernel.org, cassel@kernel.org, devicetree@vger.kernel.org,
 quic_schintav@quicinc.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 shradha.t@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 4/9] PCI: stm32: Add PCIe Endpoint
 support for STM32MP25
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

T24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgMDY6MDY6MTZQTSArMDIwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IEhlbGxvIE1hbml2YW5uYW4sCj4gCj4gT24gNC8zMC8yNSAwOTo1MCwgTWFuaXZh
bm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+ID4gT24gV2VkLCBBcHIgMjMsIDIwMjUgYXQgMTE6MDE6
MTRBTSArMDIwMCwgQ2hyaXN0aWFuIEJydWVsIHdyb3RlOgo+ID4gPiBBZGQgZHJpdmVyIHRvIGNv
bmZpZ3VyZSB0aGUgU1RNMzJNUDI1IFNvQyBQQ0llIEdlbjEgMi41R1QvcyBvciBHZW4yIDVHVC9z
Cj4gPiA+IGNvbnRyb2xsZXIgYmFzZWQgb24gdGhlIERlc2lnbldhcmUgUENJZSBjb3JlIGluIGVu
ZHBvaW50IG1vZGUuCj4gPiA+IAo+ID4gPiBVc2VzIHRoZSBjb21tb24gcmVmZXJlbmNlIGNsb2Nr
IHByb3ZpZGVkIGJ5IHRoZSBob3N0Lgo+ID4gPiAKPiA+ID4gVGhlIFBDSWUgY29yZV9jbGsgcmVj
ZWl2ZXMgdGhlIHBpcGUwX2NsayBmcm9tIHRoZSBDb21ib1BIWSBhcyBpbnB1dCwKPiA+ID4gYW5k
IHRoZSBDb21ib1BIWSBQTEwgbXVzdCBiZSBsb2NrZWQgZm9yIHBpcGUwX2NsayB0byBiZSByZWFk
eS4KPiA+ID4gQ29uc2VxdWVudGx5LCBQQ0llIGNvcmUgcmVnaXN0ZXJzIGNhbm5vdCBiZSBhY2Nl
c3NlZCB1bnRpbCB0aGUgQ29tYm9QSFkgaXMKPiA+ID4gZnVsbHkgaW5pdGlhbGlzZWQgYW5kIHJl
ZmNsayBpcyBlbmFibGVkIGFuZCByZWFkeS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBCcnVlbCA8Y2hyaXN0aWFuLmJydWVsQGZvc3Muc3QuY29tPgo+ID4gPiAtLS0KPiA+
ID4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnICAgICAgICAgfCAgMTIgKwo+
ID4gPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL01ha2VmaWxlICAgICAgICB8ICAgMSAr
Cj4gPiA+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zdG0zMi1lcC5jIHwgNDE0
ICsrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtc3RtMzIuaCAgICB8ICAgMSArCj4gPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCA0MjggaW5z
ZXJ0aW9ucygrKQo+ID4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLXN0bTMyLWVwLmMKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
S2NvbmZpZwo+ID4gPiBpbmRleCAyYWVjNWQyZjlhNDYuLmFjZWZmN2QxZWYzMyAxMDA2NDQKPiA+
ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZwo+ID4gPiArKysgYi9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnCj4gPiA+IEBAIC00MjIsNiArNDIyLDE4
IEBAIGNvbmZpZyBQQ0lFX1NUTTMyX0hPU1QKPiA+ID4gICAJICBUaGlzIGRyaXZlciBjYW4gYWxz
byBiZSBidWlsdCBhcyBhIG1vZHVsZS4gSWYgc28sIHRoZSBtb2R1bGUKPiA+ID4gICAJICB3aWxs
IGJlIGNhbGxlZCBwY2llLXN0bTMyLgo+ID4gPiArY29uZmlnIFBDSUVfU1RNMzJfRVAKPiA+ID4g
Kwl0cmlzdGF0ZSAiU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyTVAyNSBQQ0llIENvbnRyb2xsZXIg
KGVuZHBvaW50IG1vZGUpIgo+ID4gPiArCWRlcGVuZHMgb24gQVJDSF9TVE0zMiB8fCBDT01QSUxF
X1RFU1QKPiA+ID4gKwlkZXBlbmRzIG9uIFBDSV9FTkRQT0lOVAo+ID4gPiArCXNlbGVjdCBQQ0lF
X0RXX0VQCj4gPiA+ICsJaGVscAo+ID4gPiArCSAgRW5hYmxlcyBlbmRwb2ludCBzdXBwb3J0IGZv
ciBEZXNpZ25XYXJlIGNvcmUgYmFzZWQgUENJZSBjb250cm9sbGVyCj4gPiA+ICsJICBmb3VuZCBp
biBTVE0zMk1QMjUgU29DLgo+ID4gCj4gPiBDYW4geW91IHBsZWFzZSB1c2Ugc2ltaWxhciBkZXNj
cmlwdGlvbiBmb3IgdGhlIFJDIGRyaXZlciBhbHNvPwo+ID4gCj4gPiAiRW5hYmxlcyBSb290IENv
bXBsZXggKFJDKSBzdXBwb3J0IGZvciB0aGUgRGVzaWduV2FyZSBjb3JlIGJhc2VkIFBDSWUgaG9z
dAo+ID4gY29udHJvbGxlciBmb3VuZCBpbiBTVE0zMk1QMjUgU29DLiIKPiAKPiBZZXMsIHdpbGwg
YWxpZ24gdGhlIG1lc3NhZ2VzCj4gCj4gPiA+ICsKPiA+ID4gKwkgIFRoaXMgZHJpdmVyIGNhbiBh
bHNvIGJlIGJ1aWx0IGFzIGEgbW9kdWxlLiBJZiBzbywgdGhlIG1vZHVsZQo+ID4gPiArCSAgd2ls
bCBiZSBjYWxsZWQgcGNpZS1zdG0zMi1lcC4KPiA+ID4gKwo+ID4gPiAgIGNvbmZpZyBQQ0lfRFJB
N1hYCj4gPiA+ICAgCXRyaXN0YXRlCj4gPiAKPiA+IFsuLi5dCj4gPiAKPiA+ID4gK3N0YXRpYyBp
bnQgc3RtMzJfYWRkX3BjaWVfZXAoc3RydWN0IHN0bTMyX3BjaWUgKnN0bTMyX3BjaWUsCj4gPiA+
ICsJCQkgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ICt7Cj4gPiA+ICsJ
c3RydWN0IGR3X3BjaWVfZXAgKmVwID0gJnN0bTMyX3BjaWUtPnBjaS5lcDsKPiA+ID4gKwlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ID4gPiArCWludCByZXQ7Cj4gPiA+ICsKPiA+
ID4gKwlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGRldik7Cj4gPiAKPiA+IFRoaXMg
bmVlZHMgdG8gYmUgY2FsbGVkIGJlZm9yZSBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKCkuCj4gCj4g
T0suIEFsc28gYW5kIHdlIG11c3QgdXNlIHBtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKCkgaGVyZS4K
PiAKClllcyEKCj4gPiAKPiA+ID4gKwlpZiAocmV0IDwgMCkgewo+ID4gPiArCQlkZXZfZXJyKGRl
diwgInBtIHJ1bnRpbWUgcmVzdW1lIGZhaWxlZDogJWRcbiIsIHJldCk7Cj4gPiA+ICsJCXJldHVy
biByZXQ7Cj4gPiA+ICsJfQo+ID4gPiArCj4gPiA+ICsJcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRz
KHN0bTMyX3BjaWUtPnJlZ21hcCwgU1lTQ0ZHX1BDSUVDUiwKPiA+ID4gKwkJCQkgU1RNMzJNUDI1
X1BDSUVDUl9UWVBFX01BU0ssCj4gPiA+ICsJCQkJIFNUTTMyTVAyNV9QQ0lFQ1JfRVApOwo+ID4g
PiArCWlmIChyZXQpIHsKPiA+ID4gKwkJZ290byBlcnJfcG1fcHV0X3N5bmM7Cj4gPiA+ICsJCXJl
dHVybiByZXQ7Cj4gPiA+ICsJfQo+ID4gPiArCj4gPiA+ICsJcmVzZXRfY29udHJvbF9hc3NlcnQo
c3RtMzJfcGNpZS0+cnN0KTsKPiA+ID4gKwlyZXNldF9jb250cm9sX2RlYXNzZXJ0KHN0bTMyX3Bj
aWUtPnJzdCk7Cj4gPiA+ICsKPiA+ID4gKwllcC0+b3BzID0gJnN0bTMyX3BjaWVfZXBfb3BzOwo+
ID4gPiArCj4gPiA+ICsJcmV0ID0gZHdfcGNpZV9lcF9pbml0KGVwKTsKPiA+ID4gKwlpZiAocmV0
KSB7Cj4gPiA+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGluaXRpYWxpemUgZXA6ICVkXG4i
LCByZXQpOwo+ID4gPiArCQlnb3RvIGVycl9wbV9wdXRfc3luYzsKPiA+ID4gKwl9Cj4gPiA+ICsK
PiA+ID4gKwlyZXQgPSBzdG0zMl9wY2llX2VuYWJsZV9yZXNvdXJjZXMoc3RtMzJfcGNpZSk7Cj4g
PiA+ICsJaWYgKHJldCkgewo+ID4gPiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBlbmFibGUg
cmVzb3VyY2VzOiAlZFxuIiwgcmV0KTsKPiA+ID4gKwkJZ290byBlcnJfZXBfZGVpbml0Owo+ID4g
PiArCX0KPiA+ID4gKwo+ID4gPiArCXJldCA9IGR3X3BjaWVfZXBfaW5pdF9yZWdpc3RlcnMoZXAp
Owo+ID4gPiArCWlmIChyZXQpIHsKPiA+ID4gKwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gaW5p
dGlhbGl6ZSBEV0MgZW5kcG9pbnQgcmVnaXN0ZXJzXG4iKTsKPiA+ID4gKwkJZ290byBlcnJfZGlz
YWJsZV9yZXNvdXJjZXM7Cj4gPiA+ICsJfQo+ID4gPiArCj4gPiA+ICsJcGNpX2VwY19pbml0X25v
dGlmeShlcC0+ZXBjKTsKPiA+ID4gKwo+ID4gCj4gPiBIbW0sIGxvb2tzIGxpa2UgeW91IG5lZWQg
dG8gZHVwbGljYXRlIGR3X3BjaWVfZXBfaW5pdF9yZWdpc3RlcnMoKSBhbmQKPiA+IHBjaV9lcGNf
aW5pdF9ub3RpZnkoKSBpbiBzdG0zMl9wY2llX3BlcnN0X2RlYXNzZXJ0KCkgZm9yIGh3IHNwZWNp
ZmljIHJlYXNvbnMuCj4gPiBTbyBjYW4geW91IGRyb3AgdGhlc2UgZnJvbSB0aGVyZT8KPiAKPiBX
ZSBjYW5ub3QgcmVtb3ZlIGR3X3BjaWVfZXBfaW5pdF9yZWdpc3RlcnMoKSBhbmQgZHdfcGNpZV9l
cF9pbml0X3JlZ2lzdGVycygpCj4gaGVyZSBiZWNhdXNlIHRoZSBQQ0llIHJlZ2lzdGVycyBuZWVk
IHRvIGJlIHJlYWR5IGF0IHRoZSBlbmQgb2YKPiBwY2llX3N0bTMyX3Byb2JlLCBhcyB0aGUgaG9z
dCBtaWdodCBhbHJlYWR5IGJlIHJ1bm5pbmcuIEluIHRoYXQgY2FzZSB0aGUKPiBob3N0IGVudW1l
cmF0ZXMgd2l0aCAvc3lzL2J1cy9wY2kvcmVzY2FuIHJhdGhlciB0aGFuIGFzc2VydGluZy9kZWFz
c2VydGluZwo+IFBFUlNUIy4KPiBUaGVyZWZvcmUsIHdlIGRvIG5vdCBuZWVkIHRvIHJlYm9vdCB0
aGUgaG9zdCBhZnRlciBpbml0aWFsaXppbmcgdGhlIEVQLiIKPiAKClNpbmNlIFBFUlNUIyBpcyBs
ZXZlbCB0cmlnZ2VyZWQsIHRoZSBlbmRwb2ludCBzaG91bGQgc3RpbGwgcmVjZWl2ZSB0aGUgUEVS
U1QjCmRlYXNzZXJ0IGludGVycnVwdCBpZiB0aGUgaG9zdCB3YXMgYWxyZWFkeSBib290ZWQuIElu
IHRoYXQgY2FzZSwgdGhlc2Ugd2lsbCBiZQpjYWxsZWQgYnkgdGhlIHN0bTMyX3BjaWVfcGVyc3Rf
ZGVhc3NlcnQoKSBmdW5jdGlvbi4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+Cu
qeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
