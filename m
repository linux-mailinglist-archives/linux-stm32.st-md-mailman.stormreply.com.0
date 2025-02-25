Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5C0A4397E
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 10:31:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EC46C78F7D;
	Tue, 25 Feb 2025 09:31:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D7F1C78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:31:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1665E5C6D0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65094C4CEEB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740475867;
 bh=VhqhUEKJybMC5Ioqu2TlM8kjWfRxkvh6hF8HPB9/5wA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EXfIAagzfTqvwWsRGznCUK3ZkWhLbD7NPhK4kB6yq1P7xsid+Jxuj9M05vjK46gYk
 3xEUD5L4kt7jgVgmhutEnYpZy/x04g+8QzkG9TZZOLMuynarF+R4825SDG6/c16yWv
 hugaeESVhquFZn7pAzz5jzYhh1gM6Bu4HVuyfgKmSUhPEdwvzHkwfFrW+h+HU5Zb+s
 7lXaIemT3IQisCddKoSlWBBoIwSZW/ViiyJKSS7+eTLmA8Jvsp1ZfGzwyn5cq4Gvhq
 WQ7cfRa0RC2dTKKnz3yQYWeTrLaQsjneKUhDcP3nEkLI3YI3iCiE/iMat4+B60vNTN
 woaslJT0QpaYg==
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-abb7520028bso714996966b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 01:31:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW2WHXUhLFxys2U3rz1lBDlSq+HPRWt3npWMtwBhdTfibI8DSvgd85ybxDm55RUDJrojfE+SxYiwiT0Dw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyrPUl+j8InqlxHqBD1DX/Fiiem8QiSSKbapve3xj4Yoa59dTau
 KSsUMDddw/5xSUaWhyy2hz5W8fN8Vm/YsXwc/fAvJu11Vd8suCpmLjO3AraTkoVu5IUzHrJ+APV
 6sWNO/CSFWkeRqR5IBG9SNW0JsDU=
X-Google-Smtp-Source: AGHT+IGLJYv/e1oxPDxFKFsKBaEaUHmq0pFseR1OcvNHLehzMt/+mZLqCUb2pCHMmsax354c1CbJrvmsMW+1OBmxUh8=
X-Received: by 2002:a17:906:3151:b0:aba:5e50:6984 with SMTP id
 a640c23a62f3a-abc099ead3amr1554594166b.2.1740475865854; Tue, 25 Feb 2025
 01:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-6-phasta@kernel.org>
In-Reply-To: <20250224135321.36603-6-phasta@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Feb 2025 17:30:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5OH7JLUUCjDAP=qfzGUVLt1HfiAYtc6Hr0oHURM0Pa9A@mail.gmail.com>
X-Gm-Features: AQ5f1Jrr8qZL58Do6GOisELNPoK9P0OBrnmwiGAX3q4INVgQhFafk3UcjXTs7oU
Message-ID: <CAAhV-H5OH7JLUUCjDAP=qfzGUVLt1HfiAYtc6Hr0oHURM0Pa9A@mail.gmail.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>, netdev@vger.kernel.org,
 Yinggang Gu <guyinggang@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Qing Zhang <zhangqing@loongson.cn>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgOTo1M+KAr1BNIFBoaWxpcHAgU3Rhbm5lciA8cGhhc3Rh
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogUGhpbGlwcCBTdGFubmVyIDxwc3Rhbm5lckBy
ZWRoYXQuY29tPgo+Cj4gVGhlIFBDSSBmdW5jdGlvbnMKPiAgIC0gcGNpbV9pb21hcF9yZWdpb25z
KCkgYW5kCj4gICAtIHBjaW1faW9tYXBfdGFibGUoKQo+IGhhdmUgYmVlbiBkZXByZWNhdGVkLgo+
Cj4gUmVwbGFjZSB0aGVtIHdpdGggdGhlaXIgc3VjY2Vzc29yIGZ1bmN0aW9uLCBwY2ltX2lvbWFw
X3JlZ2lvbigpLgo+Cj4gTWFrZSB2YXJpYWJsZSBkZWNsYXJhdGlvbiBvcmRlciBhdCBjbG9zZWJ5
IHBsYWNlcyBjb21wbHkgd2l0aCByZXZlcnNlCj4gY2hyaXN0bWFzIHRyZWUgb3JkZXIuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFN0YW5uZXIgPHBzdGFubmVyQHJlZGhhdC5jb20+ClJldmll
d2VkLWJ5OiBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBsb29uZ3Nvbi5jbj4KCj4gLS0tCj4gIC4u
Li9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYyAgIHwgMTEgKysr
Ky0tLS0tLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3Bj
aS5jICAgfCAxNCArKysrKystLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDE1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4gaW5kZXggZjNlYTYwMTZiZTY4Li4y
NWVmN2I5YzVkY2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMKPiBAQCAtNTIxLDEwICs1MjEsMTAgQEAgc3RhdGlj
IGludCBsb29uZ3Nvbl9kd21hY19hY3BpX2NvbmZpZyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiAg
c3RhdGljIGludCBsb29uZ3Nvbl9kd21hY19wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29u
c3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmlkKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgcGxhdF9z
dG1tYWNlbmV0X2RhdGEgKnBsYXQ7Cj4gKyAgICAgICBzdHJ1Y3Qgc3RtbWFjX3Jlc291cmNlcyBy
ZXMgPSB7fTsKPiAgICAgICAgIHN0cnVjdCBzdG1tYWNfcGNpX2luZm8gKmluZm87Cj4gLSAgICAg
ICBzdHJ1Y3Qgc3RtbWFjX3Jlc291cmNlcyByZXM7Cj4gICAgICAgICBzdHJ1Y3QgbG9vbmdzb25f
ZGF0YSAqbGQ7Cj4gLSAgICAgICBpbnQgcmV0LCBpOwo+ICsgICAgICAgaW50IHJldDsKPgo+ICAg
ICAgICAgcGxhdCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnBsYXQpLCBHRlBf
S0VSTkVMKTsKPiAgICAgICAgIGlmICghcGxhdCkKPiBAQCAtNTU0LDEzICs1NTQsMTEgQEAgc3Rh
dGljIGludCBsb29uZ3Nvbl9kd21hY19wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qg
c3RydWN0IHBjaV9kZXZpY2VfaWQKPiAgICAgICAgIHBjaV9zZXRfbWFzdGVyKHBkZXYpOwo+Cj4g
ICAgICAgICAvKiBHZXQgdGhlIGJhc2UgYWRkcmVzcyBvZiBkZXZpY2UgKi8KPiAtICAgICAgIHJl
dCA9IHBjaW1faW9tYXBfcmVnaW9ucyhwZGV2LCBCSVQoMCksIERSSVZFUl9OQU1FKTsKPiArICAg
ICAgIHJlcy5hZGRyID0gcGNpbV9pb21hcF9yZWdpb24ocGRldiwgMCwgRFJJVkVSX05BTUUpOwo+
ICsgICAgICAgcmV0ID0gUFRSX0VSUl9PUl9aRVJPKHJlcy5hZGRyKTsKPiAgICAgICAgIGlmIChy
ZXQpCj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2Rpc2FibGVfZGV2aWNlOwo+Cj4gLSAgICAg
ICBtZW1zZXQoJnJlcywgMCwgc2l6ZW9mKHJlcykpOwo+IC0gICAgICAgcmVzLmFkZHIgPSBwY2lt
X2lvbWFwX3RhYmxlKHBkZXYpWzBdOwo+IC0KPiAgICAgICAgIHBsYXQtPmJzcF9wcml2ID0gbGQ7
Cj4gICAgICAgICBwbGF0LT5zZXR1cCA9IGxvb25nc29uX2R3bWFjX3NldHVwOwo+ICAgICAgICAg
bGQtPmRldiA9ICZwZGV2LT5kZXY7Cj4gQEAgLTYwMyw3ICs2MDEsNiBAQCBzdGF0aWMgdm9pZCBs
b29uZ3Nvbl9kd21hY19yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gICAgICAgICBzdHJ1
Y3QgbmV0X2RldmljZSAqbmRldiA9IGRldl9nZXRfZHJ2ZGF0YSgmcGRldi0+ZGV2KTsKPiAgICAg
ICAgIHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiA9IG5ldGRldl9wcml2KG5kZXYpOwo+ICAgICAg
ICAgc3RydWN0IGxvb25nc29uX2RhdGEgKmxkOwo+IC0gICAgICAgaW50IGk7Cj4KPiAgICAgICAg
IGxkID0gcHJpdi0+cGxhdC0+YnNwX3ByaXY7Cj4gICAgICAgICBzdG1tYWNfZHZyX3JlbW92ZSgm
cGRldi0+ZGV2KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX3BjaS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
c3RtbWFjX3BjaS5jCj4gaW5kZXggOTFmZjZjMTVmOTc3Li4zN2ZjN2Y1NWE3ZTQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BjaS5jCj4g
KysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BjaS5jCj4g
QEAgLTE1NSw5ICsxNTUsOSBAQCBzdGF0aWMgaW50IHN0bW1hY19wY2lfcHJvYmUoc3RydWN0IHBj
aV9kZXYgKnBkZXYsCj4gIHsKPiAgICAgICAgIHN0cnVjdCBzdG1tYWNfcGNpX2luZm8gKmluZm8g
PSAoc3RydWN0IHN0bW1hY19wY2lfaW5mbyAqKWlkLT5kcml2ZXJfZGF0YTsKPiAgICAgICAgIHN0
cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdDsKPiAtICAgICAgIHN0cnVjdCBzdG1tYWNf
cmVzb3VyY2VzIHJlczsKPiAtICAgICAgIGludCBpOwo+ICsgICAgICAgc3RydWN0IHN0bW1hY19y
ZXNvdXJjZXMgcmVzID0ge307Cj4gICAgICAgICBpbnQgcmV0Owo+ICsgICAgICAgaW50IGk7Cj4K
PiAgICAgICAgIHBsYXQgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpwbGF0KSwg
R0ZQX0tFUk5FTCk7Cj4gICAgICAgICBpZiAoIXBsYXQpCj4gQEAgLTE4OCwxMyArMTg4LDEzIEBA
IHN0YXRpYyBpbnQgc3RtbWFjX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgLyogR2V0IHRo
ZSBiYXNlIGFkZHJlc3Mgb2YgZGV2aWNlICovCj4gKyAgICAgICAvKiBUaGUgZmlyc3QgQkFSID4g
MCBpcyB0aGUgYmFzZSBJTyBhZGRyIG9mIG91ciBkZXZpY2UuICovCj4gICAgICAgICBmb3IgKGkg
PSAwOyBpIDwgUENJX1NURF9OVU1fQkFSUzsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIGlmIChw
Y2lfcmVzb3VyY2VfbGVuKHBkZXYsIGkpID09IDApCj4gICAgICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7Cj4gLSAgICAgICAgICAgICAgIHJldCA9IHBjaW1faW9tYXBfcmVnaW9ucyhwZGV2
LCBCSVQoaSksIHBjaV9uYW1lKHBkZXYpKTsKPiAtICAgICAgICAgICAgICAgaWYgKHJldCkKPiAt
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgICAgICAgICByZXMu
YWRkciA9IHBjaW1faW9tYXBfcmVnaW9uKHBkZXYsIGksIFNUTU1BQ19SRVNPVVJDRV9OQU1FKTsK
PiArICAgICAgICAgICAgICAgaWYgKElTX0VSUihyZXMuYWRkcikpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIFBUUl9FUlIocmVzLmFkZHIpOwo+ICAgICAgICAgICAgICAgICBicmVh
azsKPiAgICAgICAgIH0KPgo+IEBAIC0yMDQsOCArMjA0LDYgQEAgc3RhdGljIGludCBzdG1tYWNf
cGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+ICAgICAgICAgaWYgKHJldCkKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPgo+IC0gICAgICAgbWVtc2V0KCZyZXMsIDAsIHNpemVv
ZihyZXMpKTsKPiAtICAgICAgIHJlcy5hZGRyID0gcGNpbV9pb21hcF90YWJsZShwZGV2KVtpXTsK
PiAgICAgICAgIHJlcy53b2xfaXJxID0gcGRldi0+aXJxOwo+ICAgICAgICAgcmVzLmlycSA9IHBk
ZXYtPmlycTsKPgo+IC0tCj4gMi40OC4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
