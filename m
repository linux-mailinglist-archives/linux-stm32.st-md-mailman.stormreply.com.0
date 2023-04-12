Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 187606E07D0
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 09:33:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8E88C6B45C;
	Thu, 13 Apr 2023 07:33:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB6BCC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 21:45:46 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1a667067275so2916095ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 14:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681335945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=crYbUvMM+qq+UublWGJRe3AoZOF0jnjMgrzBIUloc5g=;
 b=FZVlIxDNVsZwWF/x8+9ck8AoUV65kkPC7hntmEUT/3gG4c1Hh4S5+D9+VJDE0A2pyZ
 jyEiBgaU4tE3TOFAQ0yJfZydDVj2SaJtAcSSgmvs5c187MwaugrZnCsknQwLuh+eI6iR
 jHhicBe7jcyvpbl3t5ILAmyYfCCYrGdTKYoGMAn5KpsPFqFaF8l4hj8tBRPED8kces2M
 jnkP5yRG/Fjxq7JAm/nougsXhYUODDqFACmN6o1cxSRN6F4sgK/chMqzKShWJMxsuYtY
 lRkb/AoINLm0GEHDImKvIdJCo2IdYhZ12OJBzYFcMhd7rjsRYo+Cb0OO6KyQPr51YrGE
 lnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681335945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=crYbUvMM+qq+UublWGJRe3AoZOF0jnjMgrzBIUloc5g=;
 b=Npxx2xi55qMS97cTNRMSK3rjzoGK+S3uVUnHi0TS0GCPeGl6DqVT3e1zroqid8B080
 /TOaF7fnTWovz34V5Urq27mbMaudXHpBEEuQ2rBIiFKQaGD9zdcMj6LbeKZwUDh/6vaP
 7CboR+NsMuseMOYXM22h/jORJBxfXKzJ0/1lxPSZ0GbTLToUNNsa5w8nAmkpZpflRSfv
 gl7SZnnC9j42p0tyY4WPE5/eFKFL9G7HScyzb6UdylUGfrz0LKiUOs3YKSXvM7fadXgS
 jXRLKSyMySmyYVMh+SgIqfRgY0jOX+PGeuPAuqDhdRp6cCSn9cegul5Gd+abGH8SCWQd
 2W+A==
X-Gm-Message-State: AAQBX9fZymEBh2zQl53xlsHcZYCeTpmt6LgL4ozlN4MkNOyQFKWytI03
 +hxhbV/hfRpUL9KTaazaBD2nUUw4h0DyvdkV82JyqQ==
X-Google-Smtp-Source: AKy350Y4/CZ4xHgg7rgydXEnmBND7Bc9oWAWjxox1vGjOiW+xJf6D2ah+ReO9z41JoyXkvPUW37w48iqNd537EdYth0=
X-Received: by 2002:aa7:88d4:0:b0:639:fed3:c57 with SMTP id
 k20-20020aa788d4000000b00639fed30c57mr168839pff.5.1681335945114; Wed, 12 Apr
 2023 14:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230412094235.589089-1-yoong.siang.song@intel.com>
 <20230412094235.589089-4-yoong.siang.song@intel.com>
 <ZDbjkwGS5L9wdS5h@google.com>
 <677ed6c5-51fc-4b8b-d9a4-42e4cfe9006c@intel.com>
In-Reply-To: <677ed6c5-51fc-4b8b-d9a4-42e4cfe9006c@intel.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Wed, 12 Apr 2023 14:45:33 -0700
Message-ID: <CAKH8qBtXTAZr5r1VC9ynSvGv5jWMD54d=-2qmBc9Zr3ui9HnEg@mail.gmail.com>
To: Jacob Keller <jacob.e.keller@intel.com>
X-Mailman-Approved-At: Thu, 13 Apr 2023 07:33:37 +0000
Cc: xdp-hints@xdp-project.net, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Alexander Duyck <alexanderduyck@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/4] net: stmmac: add Rx HWTS
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

T24gV2VkLCBBcHIgMTIsIDIwMjMgYXQgMTo1NuKAr1BNIEphY29iIEtlbGxlciA8amFjb2IuZS5r
ZWxsZXJAaW50ZWwuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiA0LzEyLzIwMjMgMTA6MDAgQU0sIFN0
YW5pc2xhdiBGb21pY2hldiB3cm90ZToKPiA+IE9uIDA0LzEyLCBTb25nIFlvb25nIFNpYW5nIHdy
b3RlOgo+ID4+IEFkZCByZWNlaXZlIGhhcmR3YXJlIHRpbWVzdGFtcCBtZXRhZGF0YSBzdXBwb3J0
IHZpYSBrZnVuYyB0byBYRFAgcmVjZWl2ZQo+ID4+IHBhY2tldHMuCj4gPj4KPiA+PiBTdWdnZXN0
ZWQtYnk6IFN0YW5pc2xhdiBGb21pY2hldiA8c2RmQGdvb2dsZS5jb20+Cj4gPj4gU2lnbmVkLW9m
Zi1ieTogU29uZyBZb29uZyBTaWFuZyA8eW9vbmcuc2lhbmcuc29uZ0BpbnRlbC5jb20+Cj4gPj4g
LS0tCj4gPj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hYy5oICB8
ICAzICsrKwo+ID4+ICAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWlu
LmMgfCAyNiArKysrKysrKysrKysrKysrKystCj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hYy5oIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmgKPiA+PiBpbmRleCBhYzhjY2Y4NTE3MDguLjgyNmFj
MGVjODhjNiAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9zdG1tYWMuaAo+ID4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hYy5oCj4gPj4gQEAgLTk0LDYgKzk0LDkgQEAgc3RydWN0IHN0bW1hY19yeF9idWZm
ZXIgewo+ID4+Cj4gPj4gIHN0cnVjdCBzdG1tYWNfeGRwX2J1ZmYgewo+ID4+ICAgICAgc3RydWN0
IHhkcF9idWZmIHhkcDsKPiA+PiArICAgIHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdjsKPiA+PiAr
ICAgIHN0cnVjdCBkbWFfZGVzYyAqcDsKPiA+PiArICAgIHN0cnVjdCBkbWFfZGVzYyAqbnA7Cj4g
Pj4gIH07Cj4gPj4KPiA+PiAgc3RydWN0IHN0bW1hY19yeF9xdWV1ZSB7Cj4gPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4gPj4gaW5k
ZXggZjdiYmRmMDRkMjBjLi5lZDY2MDkyN2I2MjggMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ID4+ICsrKyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiA+PiBAQCAtNTMx
NSwxMCArNTMxNSwxNSBAQCBzdGF0aWMgaW50IHN0bW1hY19yeChzdHJ1Y3Qgc3RtbWFjX3ByaXYg
KnByaXYsIGludCBsaW1pdCwgdTMyIHF1ZXVlKQo+ID4+Cj4gPj4gICAgICAgICAgICAgICAgICAg
ICAgeGRwX2luaXRfYnVmZigmY3R4LnhkcCwgYnVmX3N6LCAmcnhfcS0+eGRwX3J4cSk7Cj4gPj4g
ICAgICAgICAgICAgICAgICAgICAgeGRwX3ByZXBhcmVfYnVmZigmY3R4LnhkcCwgcGFnZV9hZGRy
ZXNzKGJ1Zi0+cGFnZSksCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBidWYtPnBhZ2Vfb2Zmc2V0LCBidWYxX2xlbiwgZmFsc2UpOwo+ID4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYnVmLT5wYWdlX29mZnNldCwgYnVmMV9sZW4sIHRydWUp
Owo+ID4+Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgcHJlX2xlbiA9IGN0eC54ZHAuZGF0YV9l
bmQgLSBjdHgueGRwLmRhdGFfaGFyZF9zdGFydCAtCj4gPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJ1Zi0+cGFnZV9vZmZzZXQ7Cj4gPj4gKwo+ID4+ICsgICAgICAgICAgICAgICAg
ICAgIGN0eC5wcml2ID0gcHJpdjsKPiA+PiArICAgICAgICAgICAgICAgICAgICBjdHgucCA9IHA7
Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgY3R4Lm5wID0gbnA7Cj4gPj4gKwo+ID4+ICAgICAg
ICAgICAgICAgICAgICAgIHNrYiA9IHN0bW1hY194ZHBfcnVuX3Byb2cocHJpdiwgJmN0eC54ZHAp
Owo+ID4+ICAgICAgICAgICAgICAgICAgICAgIC8qIER1ZSB4ZHBfYWRqdXN0X3RhaWw6IERNQSBz
eW5jIGZvcl9kZXZpY2UKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgKiBjb3ZlciBtYXggbGVu
IENQVSB0b3VjaAo+ID4+IEBAIC03MDcxLDYgKzcwNzYsMjMgQEAgdm9pZCBzdG1tYWNfZnBlX2hh
bmRzaGFrZShzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYsIGJvb2wgZW5hYmxlKQo+ID4+ICAgICAg
fQo+ID4+ICB9Cj4gPj4KPiA+PiArc3RhdGljIGludCBzdG1tYWNfeGRwX3J4X3RpbWVzdGFtcChj
b25zdCBzdHJ1Y3QgeGRwX21kICpfY3R4LCB1NjQgKnRpbWVzdGFtcCkKPiA+PiArewo+ID4+ICsg
ICAgY29uc3Qgc3RydWN0IHN0bW1hY194ZHBfYnVmZiAqY3R4ID0gKHZvaWQgKilfY3R4Owo+ID4+
ICsKPiA+PiArICAgICp0aW1lc3RhbXAgPSAwOwo+ID4+ICsgICAgc3RtbWFjX2dldF9yeF9od3Rz
dGFtcChjdHgtPnByaXYsIGN0eC0+cCwgY3R4LT5ucCwgdGltZXN0YW1wKTsKPiA+PiArCj4gPgo+
ID4gWy4uXQo+ID4KPiA+PiArICAgIGlmICgqdGltZXN0YW1wKQo+ID4KPiA+IE5pdDogZG9lcyBp
dCBtYWtlIHNlbnNlIHRvIGNoYW5nZSBzdG1tYWNfZ2V0X3J4X2h3dHN0YW1wIHRvIHJldHVybiBi
b29sCj4gPiB0byBpbmRpY2F0ZSBzdWNjZXNzL2ZhaWx1cmU/IFRoZW4geW91IGNhbiBkbzoKPiA+
Cj4gPiBpZiAoIXN0bW1hY19nZXRfcnhfaHd0c3RhbXAoKSkKPiA+ICAgICAgIHJldXRybiAtRU5P
REFUQTsKPgo+IEkgd291bGQgbWFrZSBpdCByZXR1cm4gdGhlIC1FTk9EQVRBIGRpcmVjdGx5IHNp
bmNlIHR5cGljYWxseSBib29sCj4gdHJ1ZS9mYWxzZSBmdW5jdGlvbnMgaGF2ZSBuYW1lcyBsaWtl
ICJzdG1tYWNfaGFzX3J4X2h3dHN0YW1wIiBvciBzaW1pbGFyCj4gbmFtZSB0aGF0IGluZmVycyB5
b3UncmUgYW5zd2VyaW5nIGEgdHJ1ZS9mYWxzZSBxdWVzdGlvbi4KPgo+IFRoYXQgbWlnaHQgYWxz
byBsZXQgeW91IGF2b2lkIHplcm9pbmcgdGhlIHRpbWVzdGFtcCB2YWx1ZSBmaXJzdD8KClNHVE0h
Cgo+IFRoYW5rcywKPiBKYWtlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
