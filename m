Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB70B/MGxGnOvQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 17:01:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA3B32899E
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 17:01:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D337CC8F260;
	Wed, 25 Mar 2026 16:01:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEBC7C87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 16:01:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 545B44011C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 16:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A60C4CEF7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774454506;
 bh=aldmRPDOiiniGw503t8LDK2MsDSx7z+uZZ/KCfzSBN4=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=Gk0/ZngPQjeGn36eOsdWZQWLWprEWy3AkR5hni/lE8ONxCfP3wN9iJXuu5vn2pyMJ
 nJiG+ExwL18ilB8uMi+50Px+48WLD35cA/KJzXl30cOrLm1XHkP6/u7CfzuhuMgYBp
 DDxza3CMzAS8sMQyLGYMo2oiYPpT8nggzBl8focYuTSXEM2IAcs5OZqZ1j3YzIY+XT
 1I001RKPlZrVl+U7XDdwRzb6asn8XwzNOGgT85IMqibPiISmDfL5M3GvsTJxSjcZ3J
 RB4byEEi8D5lGMQp3KZ85qQNPUmFfiaaLH5yO8GZd2D+YWbKD3ud9QCm4xCljSwmLN
 AM82iX3FkN6qw==
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-38bf47a6f02so21100511fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 09:01:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVt7CuDIHs8JPvWudbGcI2YIAQiXukJS2UnuXbsp+PdYyM/oMQBkDKx4j6GmZHQI0rc/1A14MDdP7/Qgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBm0zonG+T6S7UL/thg9o4IkDcNCATZ0kf1VVmaPfu69xczK74
 le2GvtHO5kej1oZEFnpdjDbbraUlaCvh/AH7iKpF7I8OkcU238pnCvkmLUbdUjPX75eVMJOzTl5
 ddvUt9RFNQdgJvWbV9ILI04gcUjpEJ5A=
X-Received: by 2002:a05:651c:1469:b0:38c:6b7:ad47 with SMTP id
 38308e7fff4ca-38c43072d48mr15879491fa.7.1774454504493; Wed, 25 Mar 2026
 09:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
 <20260324-deverr-v1-3-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-3-7e591cce33a3@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Mar 2026 00:01:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v66++ZtfJ_K=de9ah45sqK0sNDkPr0B64C_U+WMhW7jc-w@mail.gmail.com>
X-Gm-Features: AQROBzDy-rsBXq4Ru9U4FVjZxHD70RtzjKuDaTmPj80U_CHIL3nYWTBGwt2KYN8
Message-ID: <CAGb2v66++ZtfJ_K=de9ah45sqK0sNDkPr0B64C_U+WMhW7jc-w@mail.gmail.com>
To: Atharv Dubey <atharvd440@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Till Harbaum <till@harbaum.org>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-sunxi@lists.linux.dev,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Enrico Zanda <e.zanda1@gmail.com>,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 03/10] i2c: sun6i-p2wi: Replace dev_err()
 with dev_err_probe() in probe function
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:atharvd440@gmail.com,m:ldewangan@nvidia.com,m:till@harbaum.org,m:digetx@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:samuel@sholland.org,m:zhang.lyra@gmail.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:linux-sunxi@lists.linux.dev,m:jdelvare@suse.com,m:andi.shyti@kernel.org,m:baolin.wang@linux.alibaba.com,m:orsonzhai@gmail.com,m:linux-tegra@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:thierry.reding@gmail.com,m:mcoquelin.stm32@gmail.com,m:e.zanda1@gmail.com,m:linux-i2c@vger.kernel.org,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:thierryreding@gmail.com,m:mcoquelinstm32@gmail.com,m:ezanda1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nvidia.com,harbaum.org,gmail.com,st-md-mailman.stormreply.com,sholland.org,lists.linux.dev,suse.com,kernel.org,linux.alibaba.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.578];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5DA3B32899E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgMjoyN+KAr0FNIEF0aGFydiBEdWJleSA8YXRoYXJ2ZDQ0
MEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRW5yaWNvIFphbmRhIDxlLnphbmRhMUBnbWFp
bC5jb20+Cj4KPiBUaGlzIHNpbXBsaWZpZXMgdGhlIGNvZGUgd2hpbGUgaW1wcm92aW5nIGxvZy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEVucmljbyBaYW5kYSA8ZS56YW5kYTFAZ21haWwuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEF0aGFydiBEdWJleSA8YXRoYXJ2ZDQ0MEBnbWFpbC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3VuNmktcDJ3aS5jIHwgNTUgKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygr
KSwgMzUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1zdW42aS1wMndpLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN1bjZpLXAyd2kuYwo+IGlu
ZGV4IGZiNTI4MGI4Y2Y3Zi4uZGZmYmU3NzZhMTk1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtc3VuNmktcDJ3aS5jCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1z
dW42aS1wMndpLmMKPiBAQCAtMTk0LDIyICsxOTQsMTYgQEAgc3RhdGljIGludCBwMndpX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICBpbnQgcmV0Owo+Cj4gICAg
ICAgICBvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgImNsb2NrLWZyZXF1ZW5jeSIsICZjbGtfZnJl
cSk7Cj4gLSAgICAgICBpZiAoY2xrX2ZyZXEgPiBQMldJX01BWF9GUkVRKSB7Cj4gLSAgICAgICAg
ICAgICAgIGRldl9lcnIoZGV2LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICJyZXF1aXJlZCBj
bG9jay1mcmVxdWVuY3kgKCV1IEh6KSBpcyB0b28gaGlnaCAobWF4ID0gNk1IeikiLAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGNsa19mcmVxKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gLSAgICAgICB9Cj4gKyAgICAgICBpZiAoY2xrX2ZyZXEgPiBQMldJX01BWF9GUkVR
KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZXF1aXJlZCBjbG9jay1mcmVx
dWVuY3kgKCV1IEh6KSBpcyB0b28gaGlnaCAobWF4ID0gNk1IeikiLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjbGtfZnJlcSk7Cj4KPiAtICAgICAgIGlmIChjbGtfZnJl
cSA9PSAwKSB7Cj4gLSAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiY2xvY2stZnJlcXVlbmN5
IGlzIHNldCB0byAwIGluIERUXG4iKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gLSAgICAgICB9Cj4gKyAgICAgICBpZiAoY2xrX2ZyZXEgPT0gMCkKPiArICAgICAgICAgICAg
ICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLCAiY2xvY2stZnJlcXVlbmN5IGlz
IHNldCB0byAwIGluIERUXG4iKTsKPgo+IC0gICAgICAgaWYgKG9mX2dldF9jaGlsZF9jb3VudChu
cCkgPiAxKSB7Cj4gLSAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiUDJXSSBvbmx5IHN1cHBv
cnRzIG9uZSB0YXJnZXQgZGV2aWNlXG4iKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4gLSAgICAgICB9Cj4gKyAgICAgICBpZiAob2ZfZ2V0X2NoaWxkX2NvdW50KG5wKSA+IDEp
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwgIlAy
V0kgb25seSBzdXBwb3J0cyBvbmUgdGFyZ2V0IGRldmljZVxuIik7Cj4KPiAgICAgICAgIHAyd2kg
PSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2Yoc3RydWN0IHAyd2kpLCBHRlBfS0VSTkVMKTsKPiAg
ICAgICAgIGlmICghcDJ3aSkKPiBAQCAtMjI2LDExICsyMjAsOSBAQCBzdGF0aWMgaW50IHAyd2lf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIGNoaWxkbnAgPSBv
Zl9nZXRfbmV4dF9hdmFpbGFibGVfY2hpbGQobnAsIE5VTEwpOwo+ICAgICAgICAgaWYgKGNoaWxk
bnApIHsKPiAgICAgICAgICAgICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIoY2hpbGRu
cCwgInJlZyIsICZ0YXJnZXRfYWRkcik7Cj4gLSAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImludmFsaWQgdGFyZ2V0IGFkZHJl
c3Mgb24gbm9kZSAlcE9GXG4iLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hp
bGRucCk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gLSAgICAg
ICAgICAgICAgIH0KPiArICAgICAgICAgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImludmFsaWQgdGFyZ2V0IGFkZHJlc3Mg
b24gbm9kZSAlcE9GXG4iLCBjaGlsZG5wKTsKPgo+ICAgICAgICAgICAgICAgICBwMndpLT50YXJn
ZXRfYWRkciA9IHRhcmdldF9hZGRyOwo+ICAgICAgICAgfQo+IEBAIC0yNDUsMjYgKzIzNywyMCBA
QCBzdGF0aWMgaW50IHAyd2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIGlycTsKPgo+ICAgICAgICAgcDJ3aS0+Y2xrID0gZGV2bV9j
bGtfZ2V0X2VuYWJsZWQoZGV2LCBOVUxMKTsKPiAtICAgICAgIGlmIChJU19FUlIocDJ3aS0+Y2xr
KSkgewo+IC0gICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKHAyd2ktPmNsayk7Cj4gLSAgICAg
ICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBjbGs6ICVkXG4iLCByZXQp
Owo+IC0gICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+IC0gICAgICAgfQo+ICsgICAgICAgaWYg
KElTX0VSUihwMndpLT5jbGspKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9i
ZShkZXYsIFBUUl9FUlIocDJ3aS0+Y2xrKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgImZhaWxlZCB0byBlbmFibGUgY2xrXG4iKTsKPgo+ICAgICAgICAgcGFyZW50X2Ns
a19mcmVxID0gY2xrX2dldF9yYXRlKHAyd2ktPmNsayk7Cj4KPiAgICAgICAgIHAyd2ktPnJzdGMg
PSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZShkZXYsIE5VTEwpOwo+IC0gICAgICAg
aWYgKElTX0VSUihwMndpLT5yc3RjKSkgewo+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwg
ImZhaWxlZCB0byByZXRyaWV2ZSByZXNldCBjb250cm9sbGVyOiAlcGVcbiIsCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgcDJ3aS0+cnN0Yyk7Cj4gLSAgICAgICAgICAgICAgIHJldHVybiBQVFJf
RVJSKHAyd2ktPnJzdGMpOwo+IC0gICAgICAgfQo+ICsgICAgICAgaWYgKElTX0VSUihwMndpLT5y
c3RjKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJS
KHAyd2ktPnJzdGMpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZmFp
bGVkIHRvIHJldHJpZXZlIHJlc2V0IGNvbnRyb2xsZXJcbiIpOwo+Cj4gICAgICAgICByZXQgPSBy
ZXNldF9jb250cm9sX2RlYXNzZXJ0KHAyd2ktPnJzdGMpOwo+IC0gICAgICAgaWYgKHJldCkgewo+
IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBkZWFzc2VydCByZXNldCBs
aW5lOiAlZFxuIiwgcmV0KTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtICAgICAg
IH0KPiArICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3By
b2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIGRlYXNzZXJ0IHJlc2V0IGxpbmVcbiIpOwoKWW91IGNv
dWxkIGFsc28gc2ltcGxpZnkgdGhpcyB3aG9sZSBibG9jayB3aXRoCmRldm1fcmVzZXRfY29udHJv
bF9nZXRfZXhjbHVzaXZlX2RlYXNzZXJ0ZWQoKS4KCkVpdGhlciB3YXksCgpSZXZpZXdlZC1ieTog
Q2hlbi1ZdSBUc2FpIDx3ZW5zQGtlcm5lbC5vcmc+CgoKPiAgICAgICAgIGluaXRfY29tcGxldGlv
bigmcDJ3aS0+Y29tcGxldGUpOwo+ICAgICAgICAgcDJ3aS0+YWRhcHRlci5kZXYucGFyZW50ID0g
ZGV2Owo+IEBAIC0yNzYsOCArMjYyLDcgQEAgc3RhdGljIGludCBwMndpX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4KPiAgICAgICAgIHJldCA9IGRldm1fcmVxdWVzdF9pcnEo
ZGV2LCBpcnEsIHAyd2lfaW50ZXJydXB0LCAwLCBwZGV2LT5uYW1lLCBwMndpKTsKPiAgICAgICAg
IGlmIChyZXQpIHsKPiAtICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJjYW4ndCByZWdpc3Rl
ciBpbnRlcnJ1cHQgaGFuZGxlciBpcnElZDogJWRcbiIsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgaXJxLCByZXQpOwo+ICsgICAgICAgICAgICAgICBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAi
Y2FuJ3QgcmVnaXN0ZXIgaW50ZXJydXB0IGhhbmRsZXIgaXJxJWRcbiIsIGlycSk7Cj4gICAgICAg
ICAgICAgICAgIGdvdG8gZXJyX3Jlc2V0X2Fzc2VydDsKPiAgICAgICAgIH0KPgo+Cj4gLS0KPiAy
LjQzLjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
