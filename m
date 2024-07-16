Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 279599333E0
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2024 23:51:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3C71C71280;
	Tue, 16 Jul 2024 21:50:59 +0000 (UTC)
Received: from omta040.useast.a.cloudfilter.net
 (omta040.useast.a.cloudfilter.net [44.202.169.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39C0BC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2024 21:50:52 +0000 (UTC)
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
 by cmsmtp with ESMTPS
 id ToxZsZkJknNFGTq4Rs1def; Tue, 16 Jul 2024 21:50:51 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id Tq4Qsrn5HVDZXTq4Qsi5sF; Tue, 16 Jul 2024 21:50:51 +0000
X-Authority-Analysis: v=2.4 cv=JJ89sdKb c=1 sm=1 tr=0 ts=6696eb3b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=frY+GlAHrI6frpeK1MvySw==:17
 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=pGLkceISAAAA:8 a=phlkwaE_AAAA:8 a=JfrnYn6hAAAA:8 a=JL3bU382AdGQ-euulaEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=T3LWEMljR5ZiDmsYVIUa:22 a=uKTQOUHymn4LaG7oTSIC:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3mp/A7TaFk3Rm+5hz/oA89u2tO8OZ6IeOjXYptKzMt8=; b=nWWw3AsNeT8xCnxDTnHxVfhfKi
 uAZrezVdeRZRnDJ3QNYxxUKbK9ZqCtU1NMBi4JruljXXz/eeQAJscchCGSUfhUte2rhY0iDjUyOvS
 54CaQEsRO/6vxDZoICqMWqgRTqoi5oDJaHPYLYEPsB1ZLhTmq8/jCkUBURoVXf7VuWPzGA47EEOPd
 56mYqCxjpYKFlfIhwU9nAqiR6HLg4u0g8ersIZxfPBp7fykgdKOdkr+cowP+1JXUJmfqqeADqQSvy
 PnrzqG07TqDqTq0wITNuK6WA38iqgmnuXmMc7OzPNY+N7MN7pFq8X8lVkfYqCYcL9tZfXFF/a9CSd
 2i5ksAvA==;
Received: from [201.172.173.139] (port=56504 helo=[192.168.15.14])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1sTq4P-000Te1-2I;
 Tue, 16 Jul 2024 16:50:49 -0500
Message-ID: <d1a9d59f-00cc-4878-9cf4-eb58e9dd1562@embeddedor.com>
Date: Tue, 16 Jul 2024 15:50:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kees Cook <kees@kernel.org>, =?UTF-8?Q?Am=C3=A9lie_Delaunay?=
 <amelie.delaunay@foss.st.com>
References: <20240716213830.work.951-kees@kernel.org>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240716213830.work.951-kees@kernel.org>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.173.139
X-Source-L: No
X-Exim-ID: 1sTq4P-000Te1-2I
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.14]) [201.172.173.139]:56504
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMGa89keVU+Bon7ufKvhzah7bjO3XHgw8WJuH1lVODiBHJfSsqnXiIL7znScUpyOGIC09Wt0LEfEMTSrHTAnukeuKin890ZOnuLbmZlYA46pRYXsmZO5
 pXUqSmBxWAK3YKmzteNZ5VIgEk9vIrggszzqLPG+AlX9HONo+8ODK/9G5vSNL0zG2/lGHe22y+0AHXwIQG8qK5g/Du3Ih9WKNvh9OqzG+lVtAWyMWsWCQ+cc
Cc: linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-hardening@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dma3: Set lli_size after
	allocation
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

CgpPbiAxNi8wNy8yNCAxNTozOCwgS2VlcyBDb29rIHdyb3RlOgo+IFdpdGggdGhlIG5ldyBfX2Nv
dW50ZWRfYnkgYW5ub3RhdGlvbiwgdGhlICJsbGlfc2l6ZSIgdmFyaWFibGUgbmVlZHMgdG8KPiB2
YWxpZCBmb3IgYWNjZXNzZXMgdG8gdGhlICJsbGkiIGFycmF5LiBUaGlzIHJlcXVpcmVtZW50IGlz
IG5vdCBtZXQgaW4KPiBzdG0zMl9kbWEzX2NoYW5fZGVzY19hbGxvYygpLCBzaW5jZSAibGxpX3Np
emUiIHN0YXJ0cyBhdCAiMCIsIHNvICJsbGkiCj4gaW5kZXggIjAiIHdpbGwgbm90IGJlIGNvbnNp
ZGVyZWQgdmFsaWQgZHVyaW5nIHRoZSBpbml0aWFsaXphdGlvbiBmb3IgbG9vcC4KPiAKPiBGaXgg
dGhpcyBieSBzZXR0aW5nIGxsaV9zaXplIGltbWVkaWF0ZWx5IGFmdGVyIGFsbG9jYXRpb24gKHNp
bWlsYXIgdG8KPiBob3cgdGhpcyBpcyBoYW5kbGVkIGluIHN0bTMyX21kbWFfYWxsb2NfZGVzYygp
IGZvciB0aGUgbm9kZS9jb3VudAo+IHJlbGF0aW9uc2hpcCkuCj4gCj4gRml4ZXM6IGY1NjFlYzhi
MmIzMyAoImRtYWVuZ2luZTogQWRkIFNUTTMyIERNQTMgc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1i
eTogS2VlcyBDb29rIDxrZWVzQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogR3VzdGF2byBBLiBS
LiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgoKVGhhbmtzCi0tIApHdXN0YXZvCgo+IC0t
LQo+IENjOiAiQW3DqWxpZSBEZWxhdW5heSIgPGFtZWxpZS5kZWxhdW5heUBmb3NzLnN0LmNvbT4K
PiBDYzogVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz4KPiBDYzogTWF4aW1lIENvcXVlbGlu
IDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4
YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgo+IENjOiBkbWFlbmdpbmVAdmdlci5rZXJuZWwub3Jn
Cj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiBDYzogbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gLS0tCj4gICBkcml2ZXJzL2RtYS9z
dG0zMi9zdG0zMi1kbWEzLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEvc3RtMzIvc3Rt
MzItZG1hMy5jIGIvZHJpdmVycy9kbWEvc3RtMzIvc3RtMzItZG1hMy5jCj4gaW5kZXggNDA4N2Uw
MjYzYTQ4Li4wYmU2ZTk0NGRmNmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEvc3RtMzIvc3Rt
MzItZG1hMy5jCj4gKysrIGIvZHJpdmVycy9kbWEvc3RtMzIvc3RtMzItZG1hMy5jCj4gQEAgLTQw
Myw2ICs0MDMsNyBAQCBzdGF0aWMgc3RydWN0IHN0bTMyX2RtYTNfc3dkZXNjICpzdG0zMl9kbWEz
X2NoYW5fZGVzY19hbGxvYyhzdHJ1Y3Qgc3RtMzJfZG1hM19jaAo+ICAgCXN3ZGVzYyA9IGt6YWxs
b2Moc3RydWN0X3NpemUoc3dkZXNjLCBsbGksIGNvdW50KSwgR0ZQX05PV0FJVCk7Cj4gICAJaWYg
KCFzd2Rlc2MpCj4gICAJCXJldHVybiBOVUxMOwo+ICsJc3dkZXNjLT5sbGlfc2l6ZSA9IGNvdW50
Owo+ICAgCj4gICAJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKPiAgIAkJc3dkZXNjLT5s
bGlbaV0uaHdkZXNjID0gZG1hX3Bvb2xfemFsbG9jKGNoYW4tPmxsaV9wb29sLCBHRlBfTk9XQUlU
LAo+IEBAIC00MTAsNyArNDExLDYgQEAgc3RhdGljIHN0cnVjdCBzdG0zMl9kbWEzX3N3ZGVzYyAq
c3RtMzJfZG1hM19jaGFuX2Rlc2NfYWxsb2Moc3RydWN0IHN0bTMyX2RtYTNfY2gKPiAgIAkJaWYg
KCFzd2Rlc2MtPmxsaVtpXS5od2Rlc2MpCj4gICAJCQlnb3RvIGVycl9wb29sX2ZyZWU7Cj4gICAJ
fQo+IC0Jc3dkZXNjLT5sbGlfc2l6ZSA9IGNvdW50Owo+ICAgCXN3ZGVzYy0+Y2NyID0gMDsKPiAg
IAo+ICAgCS8qIFNldCBMTCBiYXNlIGFkZHJlc3MgKi8KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
