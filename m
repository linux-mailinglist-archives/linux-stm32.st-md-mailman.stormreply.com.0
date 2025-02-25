Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 547ECA4387A
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 10:00:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 055A5C78F6A;
	Tue, 25 Feb 2025 09:00:44 +0000 (UTC)
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com
 [91.218.175.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96582C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:00:42 +0000 (UTC)
Message-ID: <9cf9c128-9f66-488c-bd43-3f1752ec4eaa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1740474041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YyvddXJudmim1yoVeF2sZBvah7MinIT5ZBHD+XI91UM=;
 b=B6wq9Mq3uylr8OfT/MoCcqJNqcVngx4TPD6UK0+RB4M0sFWDXL91l5ukvrfU6ywvlsS3ml
 4qvMg0EmJFYFbI40yubALIDts/0glf0WXptuRXkY5cLq9ITuCrPkKo6uc9rNTFW00PilKj
 b0A+ABQ+npLY2eBgHx6CdEK+gsDCmcw=
Date: Tue, 25 Feb 2025 17:00:29 +0800
MIME-Version: 1.0
To: Philipp Stanner <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Philipp Stanner
 <pstanner@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Qing Zhang <zhangqing@loongson.cn>
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-3-phasta@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250224135321.36603-3-phasta@kernel.org>
X-Migadu-Flow: FLOW_OUT
Cc: netdev@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] stmmac: loongson: Pass
 correct arg to PCI function
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

CuWcqCAyLzI0LzI1IDk6NTMgUE0sIFBoaWxpcHAgU3Rhbm5lciDlhpnpgZM6Cj4gcGNpbV9pb21h
cF9yZWdpb25zKCkgc2hvdWxkIHJlY2VpdmUgdGhlIGRyaXZlcidzIG5hbWUgYXMgaXRzIHRoaXJk
Cj4gcGFyYW1ldGVyLCBub3QgdGhlIFBDSSBkZXZpY2UncyBuYW1lLgo+Cj4gRGVmaW5lIHRoZSBk
cml2ZXIgbmFtZSB3aXRoIGEgbWFjcm8gYW5kIHVzZSBpdCBhdCB0aGUgYXBwcm9wcmlhdGUKPiBw
bGFjZXMsIGluY2x1ZGluZyBwY2ltX2lvbWFwX3JlZ2lvbnMoKS4KPgo+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnICMgdjUuMTQrCj4gRml4ZXM6IDMwYmJhNjlkN2RiNCAoInN0bW1hYzogcGNp
OiBBZGQgZHdtYWMgc3VwcG9ydCBmb3IgTG9vbmdzb24iKQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxp
cHAgU3Rhbm5lciA8cGhhc3RhQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogWWFudGVuZyBTaSA8
c2kueWFudGVuZ0BsaW51eC5kZXY+CgoKVGhhbmtzLAoKWWFudGVuZwoKPiAtLS0KPiAgIGRyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMgfCA2ICsrKyst
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1s
b29uZ3Nvbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9v
bmdzb24uYwo+IGluZGV4IGJmZTZlMmQ2MzFiZC4uNzNhNjcxNWE5M2U2IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMKPiAr
KysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5j
Cj4gQEAgLTExLDYgKzExLDggQEAKPiAgICNpbmNsdWRlICJkd21hY19kbWEuaCIKPiAgICNpbmNs
dWRlICJkd21hYzEwMDAuaCIKPiAgIAo+ICsjZGVmaW5lIERSSVZFUl9OQU1FICJkd21hYy1sb29u
Z3Nvbi1wY2kiCj4gKwo+ICAgLyogTm9ybWFsIExvb25nc29uIFR4IFN1bW1hcnkgKi8KPiAgICNk
ZWZpbmUgRE1BX0lOVFJfRU5BX05JRV9UWF9MT09OR1NPTgkweDAwMDQwMDAwCj4gICAvKiBOb3Jt
YWwgTG9vbmdzb24gUnggU3VtbWFyeSAqLwo+IEBAIC01NTUsNyArNTU3LDcgQEAgc3RhdGljIGlu
dCBsb29uZ3Nvbl9kd21hY19wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0
IHBjaV9kZXZpY2VfaWQKPiAgIAlmb3IgKGkgPSAwOyBpIDwgUENJX1NURF9OVU1fQkFSUzsgaSsr
KSB7Cj4gICAJCWlmIChwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIGkpID09IDApCj4gICAJCQljb250
aW51ZTsKPiAtCQlyZXQgPSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRldiwgQklUKDApLCBwY2lfbmFt
ZShwZGV2KSk7Cj4gKwkJcmV0ID0gcGNpbV9pb21hcF9yZWdpb25zKHBkZXYsIEJJVCgwKSwgRFJJ
VkVSX05BTUUpOwo+ICAgCQlpZiAocmV0KQo+ICAgCQkJZ290byBlcnJfZGlzYWJsZV9kZXZpY2U7
Cj4gICAJCWJyZWFrOwo+IEBAIC02NzMsNyArNjc1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBw
Y2lfZGV2aWNlX2lkIGxvb25nc29uX2R3bWFjX2lkX3RhYmxlW10gPSB7Cj4gICBNT0RVTEVfREVW
SUNFX1RBQkxFKHBjaSwgbG9vbmdzb25fZHdtYWNfaWRfdGFibGUpOwo+ICAgCj4gICBzdGF0aWMg
c3RydWN0IHBjaV9kcml2ZXIgbG9vbmdzb25fZHdtYWNfZHJpdmVyID0gewo+IC0JLm5hbWUgPSAi
ZHdtYWMtbG9vbmdzb24tcGNpIiwKPiArCS5uYW1lID0gRFJJVkVSX05BTUUsCj4gICAJLmlkX3Rh
YmxlID0gbG9vbmdzb25fZHdtYWNfaWRfdGFibGUsCj4gICAJLnByb2JlID0gbG9vbmdzb25fZHdt
YWNfcHJvYmUsCj4gICAJLnJlbW92ZSA9IGxvb25nc29uX2R3bWFjX3JlbW92ZSwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
