Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 721F8AFC0DD
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jul 2025 04:35:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20CE0C32EA8;
	Tue,  8 Jul 2025 02:35:04 +0000 (UTC)
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C8DEC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jul 2025 02:35:03 +0000 (UTC)
Message-ID: <69687d11-e872-45da-a3d1-f91ea9dfe5f6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1751942102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qsEV695+W3Ktwe+glBrUcXpNvSeB5zOvPCRfQ1bX6vU=;
 b=ZeNYjb805OB7xPo0hz92zFWbjjSnTpEbrCvz2m7vgKsZdhXi7IDBT6yQ0cgrXhK7b9kw2/
 jHxhWK3q7GVeBA1rvUq6mipqg7NRpGnm75oKnsErdootuFdw/9NaWGOvjrrp0Z1I8me5Pq
 qR9LUOsTa1rNNWcy3jjg+Q8/i9GxfmI=
Date: Tue, 8 Jul 2025 10:34:51 +0800
MIME-Version: 1.0
To: Matthew Gerlach <matthew.gerlach@altera.com>, dinguyen@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250707154409.15527-1-matthew.gerlach@altera.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250707154409.15527-1-matthew.gerlach@altera.com>
X-Migadu-Flow: FLOW_OUT
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: net: altr,
 socfpga-stmmac.yaml: add minItems to iommus
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

5ZyoIDcvNy8yNSAxMTo0NCBQTSwgTWF0dGhldyBHZXJsYWNoIOWGmemBkzoKPiBBZGQgbWlzc2lu
ZyAnbWluSXRlbXM6IDEnIHRvIGlvbW11cyBwcm9wZXJ0eSBvZiB0aGUgQWx0ZXJhIFNPQ0ZQR0Eg
U29DCj4gaW1wbGVtZW50YXRpb24gb2YgdGhlIFN5bm9wc3lzIERXTUFDLgo+IAo+IEZpeGVzOiA2
ZDM1OWNmNDY0ZjQgKCJkdC1iaW5kaW5nczogbmV0OiBDb252ZXJ0IHNvY2ZwZ2EtZHdtYWMgYmlu
ZGluZ3MgdG8geWFtbCIpCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBHZXJsYWNoIDxtYXR0aGV3
LmdlcmxhY2hAYWx0ZXJhLmNvbT4KUmV2aWV3ZWQtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bj
cXNvZnR3YXJlLmNvbS5jbj4KClRoYW5rcywKWWFudGVuZwo+IC0tLQo+ICAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbHRyLHNvY2ZwZ2Etc3RtbWFjLnlhbWwgfCAxICsK
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FsdHIsc29jZnBnYS1zdG1tYWMueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYWx0cixzb2NmcGdhLXN0
bW1hYy55YW1sCj4gaW5kZXggYzVkOGRmZTViODAxLi5lYzM0ZGFmZjJhYTAgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbHRyLHNvY2ZwZ2Etc3Rt
bWFjLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2Fs
dHIsc29jZnBnYS1zdG1tYWMueWFtbAo+IEBAIC01OSw2ICs1OSw3IEBAIHByb3BlcnRpZXM6Cj4g
ICAgICAgICAtIGNvbnN0OiBwdHBfcmVmCj4gICAKPiAgICAgaW9tbXVzOgo+ICsgICAgbWluSXRl
bXM6IDEKPiAgICAgICBtYXhJdGVtczogMgo+ICAgCj4gICAgIHBoeS1tb2RlOgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
