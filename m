Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D16E125E
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 18:34:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B685C69063;
	Thu, 13 Apr 2023 16:34:50 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9DC8C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 16:34:48 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id bs70so7714520pgb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 09:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681403687; x=1683995687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8HvoJ679JuZRdirnHe569ZyC5ZGOdrOnvhMCfAAv7TA=;
 b=3AV1Vq3WEo42XDTB+pzABN4ZQGhRgzKvgGGRMpqjEY4vrCgRQLSc6nldf0HxtaKXa+
 kD56HHiCSZzSyEZZfu2q0r+fSBzScCJ03zomGDfbTkvrRRm5KOh5FzGP1yIyr1JW0Rxq
 mblhLqRHMs7Ag9HWqRwaLyDebTDb3XuOMG+hTbZB1ULS5r2gSRm741v8pVvzIu8TeW/7
 Pqt7v3nQIuQxKmJ1maXy3a2ncJNhstXZ2QWwC5TyAkwUE3W2UxNwQu3T6/C7arQaUu5/
 PYJEZ1dps6WXd/BqMAuuaeE0dsGIcgrRr+a+YWF/8/P36E/Zmbrp52oKsgGKdouWF+dm
 +s7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681403687; x=1683995687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8HvoJ679JuZRdirnHe569ZyC5ZGOdrOnvhMCfAAv7TA=;
 b=ODlj3xz4NMOXl0W7IxH3tjzkFKbCmipZhQxvmUKx4UULPoMNfblUIpkym0PoXw2yI0
 bxTNlfFzI4CzYBHzgWkZyahJqHxSyyse6ZsVZpCDkjIswAYBzGo5gRjHTqQ3PeQFESYo
 DL+mAId4eT7JVNqXEqKZ7VBFJ2TmM+6Tfosh4fEMi+h7SkIWK8b9+ZSKqN/IgKDK2zV+
 EeZbnCWFAMHTza2YQxXxtWIHqXpwgNocPIvyQ0NbOwKg+agmOSpnjxCkz3tjGjOLdgpp
 VH2F34yu5VLhPf2TI0AYjcTOoYjAvQeynAacMGWfa82PCDxTFngYyPPlDy3ibisNWIvF
 emvw==
X-Gm-Message-State: AAQBX9eZiSDl2T1UEybSrGBIoLfE5WN8JWcrvmPoZTmj+1jaK66s/rbo
 94q6mXHUcSVMck+4iWqMzlxiKXua3MPUXwg5Jx9cGg==
X-Google-Smtp-Source: AKy350brZLSKImyACD/vTwBAWkj9JzXf2zpBwAPKP+J93fB14HCkdn9PtWI/qhlPPMVYTW639OYp4l/LOfig57cvsRQ=
X-Received: by 2002:a63:642:0:b0:51b:fa5:7bce with SMTP id
 63-20020a630642000000b0051b0fa57bcemr679747pgg.1.1681403686843; 
 Thu, 13 Apr 2023 09:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230413032541.885238-1-yoong.siang.song@intel.com>
 <20230413032541.885238-3-yoong.siang.song@intel.com>
In-Reply-To: <20230413032541.885238-3-yoong.siang.song@intel.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Thu, 13 Apr 2023 09:34:35 -0700
Message-ID: <CAKH8qBsWwaGrL4X_xkqGtDB_4Qr3oM4wcFcWVtBanCEE6F9gCg@mail.gmail.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: xdp-hints@xdp-project.net, linux-kernel@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Alexander Duyck <alexanderduyck@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/3] net: stmmac: add Rx HWTS
 metadata to XDP receive pkt
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

T24gV2VkLCBBcHIgMTIsIDIwMjMgYXQgODoyNuKAr1BNIFNvbmcgWW9vbmcgU2lhbmcKPHlvb25n
LnNpYW5nLnNvbmdAaW50ZWwuY29tPiB3cm90ZToKPgo+IEFkZCByZWNlaXZlIGhhcmR3YXJlIHRp
bWVzdGFtcCBtZXRhZGF0YSBzdXBwb3J0IHZpYSBrZnVuYyB0byBYRFAgcmVjZWl2ZQo+IHBhY2tl
dHMuCj4KPiBTdWdnZXN0ZWQtYnk6IFN0YW5pc2xhdiBGb21pY2hldiA8c2RmQGdvb2dsZS5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogU29uZyBZb29uZyBTaWFuZyA8eW9vbmcuc2lhbmcuc29uZ0BpbnRl
bC5jb20+CgpDb25jZXB0dWFsbHkgbG9va3MgZ29vZCwgdGhhbmtzIQpBY2tlZC1ieTogU3Rhbmlz
bGF2IEZvbWljaGV2IDxzZGZAZ29vZ2xlLmNvbT4KCgo+IC0tLQo+ICBkcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWMuaCAgfCAgMyArKwo+ICAuLi4vbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCA0MCArKysrKysrKysrKysrKysrKystCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hYy5oIGIv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmgKPiBpbmRleCBhYzhj
Y2Y4NTE3MDguLjgyNmFjMGVjODhjNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9zdG1tYWMuaAo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL3N0bW1hYy5oCj4gQEAgLTk0LDYgKzk0LDkgQEAgc3RydWN0IHN0bW1hY19y
eF9idWZmZXIgewo+Cj4gIHN0cnVjdCBzdG1tYWNfeGRwX2J1ZmYgewo+ICAgICAgICAgc3RydWN0
IHhkcF9idWZmIHhkcDsKPiArICAgICAgIHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdjsKPiArICAg
ICAgIHN0cnVjdCBkbWFfZGVzYyAqcDsKPiArICAgICAgIHN0cnVjdCBkbWFfZGVzYyAqbnA7Cj4g
IH07Cj4KPiAgc3RydWN0IHN0bW1hY19yeF9xdWV1ZSB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgYi9kcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4gaW5kZXggNmZmY2U1MmNhODM3
Li44MzFhM2UyMmUwZDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiBAQCAtNTMxMywxMCArNTMxMywxNSBAQCBzdGF0aWMg
aW50IHN0bW1hY19yeChzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYsIGludCBsaW1pdCwgdTMyIHF1
ZXVlKQo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgeGRwX2luaXRfYnVmZigmY3R4LnhkcCwg
YnVmX3N6LCAmcnhfcS0+eGRwX3J4cSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgeGRwX3By
ZXBhcmVfYnVmZigmY3R4LnhkcCwgcGFnZV9hZGRyZXNzKGJ1Zi0+cGFnZSksCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBidWYtPnBhZ2Vfb2Zmc2V0LCBidWYxX2xl
biwgZmFsc2UpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnVm
LT5wYWdlX29mZnNldCwgYnVmMV9sZW4sIHRydWUpOwo+Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgcHJlX2xlbiA9IGN0eC54ZHAuZGF0YV9lbmQgLSBjdHgueGRwLmRhdGFfaGFyZF9zdGFydCAt
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJ1Zi0+cGFnZV9vZmZzZXQ7Cj4g
Kwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGN0eC5wcml2ID0gcHJpdjsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBjdHgucCA9IHA7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3R4Lm5w
ID0gbnA7Cj4gKwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNrYiA9IHN0bW1hY194ZHBfcnVu
X3Byb2cocHJpdiwgJmN0eC54ZHApOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIER1ZSB4
ZHBfYWRqdXN0X3RhaWw6IERNQSBzeW5jIGZvcl9kZXZpY2UKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgKiBjb3ZlciBtYXggbGVuIENQVSB0b3VjaAo+IEBAIC03MDYwLDYgKzcwNjUsMzcgQEAg
dm9pZCBzdG1tYWNfZnBlX2hhbmRzaGFrZShzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYsIGJvb2wg
ZW5hYmxlKQo+ICAgICAgICAgfQo+ICB9Cj4KPiArc3RhdGljIGludCBzdG1tYWNfeGRwX3J4X3Rp
bWVzdGFtcChjb25zdCBzdHJ1Y3QgeGRwX21kICpfY3R4LCB1NjQgKnRpbWVzdGFtcCkKPiArewo+
ICsgICAgICAgY29uc3Qgc3RydWN0IHN0bW1hY194ZHBfYnVmZiAqY3R4ID0gKHZvaWQgKilfY3R4
Owo+ICsgICAgICAgc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gY3R4LT5wcml2Owo+ICsgICAg
ICAgc3RydWN0IGRtYV9kZXNjICpkZXNjID0gY3R4LT5wOwo+ICsgICAgICAgc3RydWN0IGRtYV9k
ZXNjICpucCA9IGN0eC0+bnA7Cj4gKyAgICAgICBzdHJ1Y3QgZG1hX2Rlc2MgKnAgPSBjdHgtPnA7
Cj4gKyAgICAgICB1NjQgbnMgPSAwOwo+ICsKPiArICAgICAgIGlmICghcHJpdi0+aHd0c19yeF9l
bikKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9EQVRBOwo+ICsKPiArICAgICAgIC8qIEZv
ciBHTUFDNCwgdGhlIHZhbGlkIHRpbWVzdGFtcCBpcyBmcm9tIENUWCBuZXh0IGRlc2MuICovCj4g
KyAgICAgICBpZiAocHJpdi0+cGxhdC0+aGFzX2dtYWM0IHx8IHByaXYtPnBsYXQtPmhhc194Z21h
YykKPiArICAgICAgICAgICAgICAgZGVzYyA9IG5wOwo+ICsKPiArICAgICAgIC8qIENoZWNrIGlm
IHRpbWVzdGFtcCBpcyBhdmFpbGFibGUgKi8KPiArICAgICAgIGlmIChzdG1tYWNfZ2V0X3J4X3Rp
bWVzdGFtcF9zdGF0dXMocHJpdiwgcCwgbnAsIHByaXYtPmFkdl90cykpIHsKPiArICAgICAgICAg
ICAgICAgc3RtbWFjX2dldF90aW1lc3RhbXAocHJpdiwgZGVzYywgcHJpdi0+YWR2X3RzLCAmbnMp
Owo+ICsgICAgICAgICAgICAgICBucyAtPSBwcml2LT5wbGF0LT5jZGNfZXJyb3JfYWRqOwo+ICsg
ICAgICAgICAgICAgICAqdGltZXN0YW1wID0gbnNfdG9fa3RpbWUobnMpOwo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gMDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gLUVOT0RBVEE7
Cj4gK30KPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgeGRwX21ldGFkYXRhX29wcyBzdG1tYWNf
eGRwX21ldGFkYXRhX29wcyA9IHsKPiArICAgICAgIC54bW9fcnhfdGltZXN0YW1wICAgICAgICAg
ICAgICAgPSBzdG1tYWNfeGRwX3J4X3RpbWVzdGFtcCwKPiArfTsKPiArCj4gIC8qKgo+ICAgKiBz
dG1tYWNfZHZyX3Byb2JlCj4gICAqIEBkZXZpY2U6IGRldmljZSBwb2ludGVyCj4gQEAgLTcxNjcs
NiArNzIwMyw4IEBAIGludCBzdG1tYWNfZHZyX3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldmljZSwK
Pgo+ICAgICAgICAgbmRldi0+bmV0ZGV2X29wcyA9ICZzdG1tYWNfbmV0ZGV2X29wczsKPgo+ICsg
ICAgICAgbmRldi0+eGRwX21ldGFkYXRhX29wcyA9ICZzdG1tYWNfeGRwX21ldGFkYXRhX29wczsK
PiArCj4gICAgICAgICBuZGV2LT5od19mZWF0dXJlcyA9IE5FVElGX0ZfU0cgfCBORVRJRl9GX0lQ
X0NTVU0gfCBORVRJRl9GX0lQVjZfQ1NVTSB8Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE5FVElGX0ZfUlhDU1VNOwo+ICAgICAgICAgbmRldi0+eGRwX2ZlYXR1cmVzID0gTkVUREVWX1hE
UF9BQ1RfQkFTSUMgfCBORVRERVZfWERQX0FDVF9SRURJUkVDVCB8Cj4gLS0KPiAyLjM0LjEKPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
