Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A677A435FD
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 08:16:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE447C78F9A;
	Tue, 25 Feb 2025 07:16:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E609DC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740467783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXXY3hCS9dJ1Ur2pQC/iJ+uAm9WAz2sQ3CodAQOx9jA=;
 b=hFU4dmy6R4ttvPD8csidBXGBj1Bvbs4W3PV9gAKW7GTj5pWiI+vfuqkDRCslPS+JiwnRq/
 gxFyosHo2NuIPSJip6sGiEzNQCQd1ItbjS10GNpb+d0Jo8CP+L2i79LamPjqdIzcpz6Yij
 aUQGN5hoTt8+xJGk3gRn0MjMP2AhLLY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-1KJNM0YSPDWHpsWDloeXkA-1; Tue, 25 Feb 2025 02:16:22 -0500
X-MC-Unique: 1KJNM0YSPDWHpsWDloeXkA-1
X-Mimecast-MFC-AGG-ID: 1KJNM0YSPDWHpsWDloeXkA_1740467781
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4393e89e910so28947525e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 23:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740467781; x=1741072581;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nQ8ganHFrjZwdAsNJKERIzeXH5APWE2/FMGZlEN7QT0=;
 b=vpgOCiE86hw8i9IcS7gIvLh+N8nWwf0dzUiWs46w6fvobZT+U89UM5+AkjxasFg7/X
 5Mrzsu++C8YJasHGQ1T7u6I+BJQBTtzxiqM9+sShfKUfBG6B9qv1YT6EYrZJ9tGELQP5
 5Gh58RcI8YUHdMzB8X13Amzwgl27OgXHvjH6JLddVmy0XvLJx34XMBD6i13Y9Tt7BKk3
 0pVwvp2aTGrjkB1Yx8/K4FzspXFrqttLDpek7Rd3tVYgMY9K0zWIaMLdjMf2SGa8Z4yp
 ZWnLaCEFng2zS/5bydTPk2Ybx5HSaTpJDAe4BqfEWOmcj/LNWKD3221/N4bBsCyVdahK
 nd9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCUoysG0lY8qjx5lK+9wKllX3ZdlX7zLA7wBH4rq+v0AiOKOAwY/cyx/h3gZYbAklUAAZ5Qp9H0Wbl6w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxcRhtKHKWbBaJ4dkeIEqkbdmYC6mdUpx1wXR7ahsL1pKaIpfFj
 S9kQVTuRCN0eLRBWruAf0WM2rXJ/mXnKwO8pfVGUOOP7NR1VyhZZ1k2+Q9ZiNnXEBLo/VixBb8j
 0psy7KQLJFTQNmdoyNgkow0qGcn77TliRwLVH5PZZBS1HFz40h+PBFAjNNdepL+WiCOgocUabF7
 UOiw==
X-Gm-Gg: ASbGncsJHPem9n6Myg/EV7KIY9JhbxG3G/AB3kUuPF3MTdVSK1FSah201U9E/iC6Exg
 Ktm9ZC6VvzdjabUOLm4MmzS3TATFV+q14LW2CqdwvcKEZleiqC0bpZZZIC3nTWGEIoWINZPKcMN
 Ym+AcU4xVTpN2zWVA2r+2qQg4Fio6uS2p2G2LWrWd/jEmzcfaa4kYuFGb14adif4DmXVWFcK7to
 CaspNpEXVi6ROq3MrcJvpESChGmMsxwSn8+X2q858AldXAheABkXf0DQcfY3iWLm5FK8h7Vx/8W
 C5rPp3uH8+4RJ7J4IBRjISrYf7cEy+PZPWWx72ajPQ==
X-Received: by 2002:a05:600c:4e8b:b0:439:9eba:939a with SMTP id
 5b1f17b1804b1-43ab0f8b68bmr15347925e9.26.1740467781036; 
 Mon, 24 Feb 2025 23:16:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKAYIbDeUkxN/sPOdOh9dmDT/KC44JigW8G4nDwTJ+erWGkxMnzLVafhwjP4Cz13s3tIx2WQ==
X-Received: by 2002:a05:600c:4e8b:b0:439:9eba:939a with SMTP id
 5b1f17b1804b1-43ab0f8b68bmr15347625e9.26.1740467780642; 
 Mon, 24 Feb 2025 23:16:20 -0800 (PST)
Received: from [10.32.64.164] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab1539da5sm15328505e9.10.2025.02.24.23.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 23:16:20 -0800 (PST)
Message-ID: <f1c3e538e19aca7fd46dd7f10da190d691bace83.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Philipp Stanner <phasta@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Huacai Chen
 <chenhuacai@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Yinggang Gu
 <guyinggang@loongson.cn>, Feiyang Chen <chenfeiyang@loongson.cn>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>
Date: Tue, 25 Feb 2025 08:16:18 +0100
In-Reply-To: <20250224135321.36603-6-phasta@kernel.org>
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-6-phasta@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wXGp0-02OkylXpDd2sLekpoZkOzB6Eh3Vk1SrPrkOk0_1740467781
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/4] stmmac: Replace
	deprecated PCI functions
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

T24gTW9uLCAyMDI1LTAyLTI0IGF0IDE0OjUzICswMTAwLCBQaGlsaXBwIFN0YW5uZXIgd3JvdGU6
Cj4gRnJvbTogUGhpbGlwcCBTdGFubmVyIDxwc3Rhbm5lckByZWRoYXQuY29tPgo+IAo+IFRoZSBQ
Q0kgZnVuY3Rpb25zCj4gwqAgLSBwY2ltX2lvbWFwX3JlZ2lvbnMoKSBhbmQKPiDCoCAtIHBjaW1f
aW9tYXBfdGFibGUoKQo+IGhhdmUgYmVlbiBkZXByZWNhdGVkLgo+IAo+IFJlcGxhY2UgdGhlbSB3
aXRoIHRoZWlyIHN1Y2Nlc3NvciBmdW5jdGlvbiwgcGNpbV9pb21hcF9yZWdpb24oKS4KPiAKPiBN
YWtlIHZhcmlhYmxlIGRlY2xhcmF0aW9uIG9yZGVyIGF0IGNsb3NlYnkgcGxhY2VzIGNvbXBseSB3
aXRoIHJldmVyc2UKPiBjaHJpc3RtYXMgdHJlZSBvcmRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQ
aGlsaXBwIFN0YW5uZXIgPHBzdGFubmVyQHJlZGhhdC5jb20+Cj4gLS0tCj4gwqAuLi4vbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmPCoMKgIHwgMTEgKysrKy0tLS0t
LS0KPiDCoGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wY2kuY8Kg
wqAgfCAxNCArKysrKystLS0tLS0KPiAtLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+IGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+IGluZGV4IGYzZWE2MDE2YmU2
OC4uMjVlZjdiOWM1ZGNlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4gQEAgLTUyMSwxMCArNTIxLDEwIEBAIHN0
YXRpYyBpbnQgbG9vbmdzb25fZHdtYWNfYWNwaV9jb25maWcoc3RydWN0Cj4gcGNpX2RldiAqcGRl
diwKPiDCoHN0YXRpYyBpbnQgbG9vbmdzb25fZHdtYWNfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBk
ZXYsIGNvbnN0IHN0cnVjdAo+IHBjaV9kZXZpY2VfaWQgKmlkKQo+IMKgewo+IMKgCXN0cnVjdCBw
bGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdDsKPiArCXN0cnVjdCBzdG1tYWNfcmVzb3VyY2VzIHJl
cyA9IHt9Owo+IMKgCXN0cnVjdCBzdG1tYWNfcGNpX2luZm8gKmluZm87Cj4gLQlzdHJ1Y3Qgc3Rt
bWFjX3Jlc291cmNlcyByZXM7Cj4gwqAJc3RydWN0IGxvb25nc29uX2RhdGEgKmxkOwo+IC0JaW50
IHJldCwgaTsKPiArCWludCByZXQ7Cj4gwqAKPiDCoAlwbGF0ID0gZGV2bV9remFsbG9jKCZwZGV2
LT5kZXYsIHNpemVvZigqcGxhdCksIEdGUF9LRVJORUwpOwo+IMKgCWlmICghcGxhdCkKPiBAQCAt
NTU0LDEzICs1NTQsMTEgQEAgc3RhdGljIGludCBsb29uZ3Nvbl9kd21hY19wcm9iZShzdHJ1Y3Qg
cGNpX2Rldgo+ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZAo+IMKgCXBjaV9zZXRf
bWFzdGVyKHBkZXYpOwo+IMKgCj4gwqAJLyogR2V0IHRoZSBiYXNlIGFkZHJlc3Mgb2YgZGV2aWNl
ICovCj4gLQlyZXQgPSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRldiwgQklUKDApLCBEUklWRVJfTkFN
RSk7Cj4gKwlyZXMuYWRkciA9IHBjaW1faW9tYXBfcmVnaW9uKHBkZXYsIDAsIERSSVZFUl9OQU1F
KTsKPiArCXJldCA9IFBUUl9FUlJfT1JfWkVSTyhyZXMuYWRkcik7Cj4gwqAJaWYgKHJldCkKPiDC
oAkJZ290byBlcnJfZGlzYWJsZV9kZXZpY2U7Cj4gwqAKPiAtCW1lbXNldCgmcmVzLCAwLCBzaXpl
b2YocmVzKSk7Cj4gLQlyZXMuYWRkciA9IHBjaW1faW9tYXBfdGFibGUocGRldilbMF07Cj4gLQo+
IMKgCXBsYXQtPmJzcF9wcml2ID0gbGQ7Cj4gwqAJcGxhdC0+c2V0dXAgPSBsb29uZ3Nvbl9kd21h
Y19zZXR1cDsKPiDCoAlsZC0+ZGV2ID0gJnBkZXYtPmRldjsKPiBAQCAtNjAzLDcgKzYwMSw2IEBA
IHN0YXRpYyB2b2lkIGxvb25nc29uX2R3bWFjX3JlbW92ZShzdHJ1Y3QgcGNpX2Rldgo+ICpwZGV2
KQo+IMKgCXN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0gZGV2X2dldF9kcnZkYXRhKCZwZGV2LT5k
ZXYpOwo+IMKgCXN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiA9IG5ldGRldl9wcml2KG5kZXYpOwo+
IMKgCXN0cnVjdCBsb29uZ3Nvbl9kYXRhICpsZDsKPiAtCWludCBpOwoKSnVzdCBzYXcgdGhhdCB0
aGlzIGlzIGEgbGVmdC1vdmVyIHRoYXQgYWN0dWFsbHkgc2hvdWxkIGJlIGluIHBhdGNoIDMuCldp
bGwgZml4LgoKClAuCgo+IMKgCj4gwqAJbGQgPSBwcml2LT5wbGF0LT5ic3BfcHJpdjsKPiDCoAlz
dG1tYWNfZHZyX3JlbW92ZSgmcGRldi0+ZGV2KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BjaS5jCj4gYi9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcGNpLmMKPiBpbmRleCA5MWZmNmMxNWY5NzcuLjM3
ZmM3ZjU1YTdlNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9zdG1tYWNfcGNpLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9zdG1tYWNfcGNpLmMKPiBAQCAtMTU1LDkgKzE1NSw5IEBAIHN0YXRpYyBpbnQgc3RtbWFj
X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiDCoHsKPiDCoAlzdHJ1Y3Qgc3RtbWFj
X3BjaV9pbmZvICppbmZvID0gKHN0cnVjdCBzdG1tYWNfcGNpX2luZm8gKilpZC0KPiA+ZHJpdmVy
X2RhdGE7Cj4gwqAJc3RydWN0IHBsYXRfc3RtbWFjZW5ldF9kYXRhICpwbGF0Owo+IC0Jc3RydWN0
IHN0bW1hY19yZXNvdXJjZXMgcmVzOwo+IC0JaW50IGk7Cj4gKwlzdHJ1Y3Qgc3RtbWFjX3Jlc291
cmNlcyByZXMgPSB7fTsKPiDCoAlpbnQgcmV0Owo+ICsJaW50IGk7Cj4gwqAKPiDCoAlwbGF0ID0g
ZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqcGxhdCksIEdGUF9LRVJORUwpOwo+IMKg
CWlmICghcGxhdCkKPiBAQCAtMTg4LDEzICsxODgsMTMgQEAgc3RhdGljIGludCBzdG1tYWNfcGNp
X3Byb2JlKHN0cnVjdCBwY2lfZGV2Cj4gKnBkZXYsCj4gwqAJCXJldHVybiByZXQ7Cj4gwqAJfQo+
IMKgCj4gLQkvKiBHZXQgdGhlIGJhc2UgYWRkcmVzcyBvZiBkZXZpY2UgKi8KPiArCS8qIFRoZSBm
aXJzdCBCQVIgPiAwIGlzIHRoZSBiYXNlIElPIGFkZHIgb2Ygb3VyIGRldmljZS4gKi8KPiDCoAlm
b3IgKGkgPSAwOyBpIDwgUENJX1NURF9OVU1fQkFSUzsgaSsrKSB7Cj4gwqAJCWlmIChwY2lfcmVz
b3VyY2VfbGVuKHBkZXYsIGkpID09IDApCj4gwqAJCQljb250aW51ZTsKPiAtCQlyZXQgPSBwY2lt
X2lvbWFwX3JlZ2lvbnMocGRldiwgQklUKGkpLAo+IHBjaV9uYW1lKHBkZXYpKTsKPiAtCQlpZiAo
cmV0KQo+IC0JCQlyZXR1cm4gcmV0Owo+ICsJCXJlcy5hZGRyID0gcGNpbV9pb21hcF9yZWdpb24o
cGRldiwgaSwKPiBTVE1NQUNfUkVTT1VSQ0VfTkFNRSk7Cj4gKwkJaWYgKElTX0VSUihyZXMuYWRk
cikpCj4gKwkJCXJldHVybiBQVFJfRVJSKHJlcy5hZGRyKTsKPiDCoAkJYnJlYWs7Cj4gwqAJfQo+
IMKgCj4gQEAgLTIwNCw4ICsyMDQsNiBAQCBzdGF0aWMgaW50IHN0bW1hY19wY2lfcHJvYmUoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsCj4gwqAJaWYgKHJldCkKPiDCoAkJcmV0dXJuIHJldDsKPiDCoAo+
IC0JbWVtc2V0KCZyZXMsIDAsIHNpemVvZihyZXMpKTsKPiAtCXJlcy5hZGRyID0gcGNpbV9pb21h
cF90YWJsZShwZGV2KVtpXTsKPiDCoAlyZXMud29sX2lycSA9IHBkZXYtPmlycTsKPiDCoAlyZXMu
aXJxID0gcGRldi0+aXJxOwo+IMKgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
