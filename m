Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA928162C75
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2020 18:18:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6639CC36B0B;
	Tue, 18 Feb 2020 17:18:17 +0000 (UTC)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 637C9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 17:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582046295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ek37kVTDy+eubHSmBaHlU9802HiWJpZwSmyiNbGJoro=;
 b=M5rFuEHug/ZtNlxV0hPVRe9RcJpZ9v57I1lCLNI7XP0rHcl5vBKMovji8EYkwDo7w8JJNd
 SCLUW3jX/iInQbhS6552040hwLhJMrnDSOw5yKFL89y0QPmEvcoylKbgPcrm8t4qagSbyb
 CzLpsTQMl1WxD32zFrCV52RiGjP0KGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-uC0VfL6AP3Ci3cM_MFvf2Q-1; Tue, 18 Feb 2020 12:18:10 -0500
X-MC-Unique: uC0VfL6AP3Ci3cM_MFvf2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CD648010FF;
 Tue, 18 Feb 2020 17:18:06 +0000 (UTC)
Received: from carbon (ovpn-200-26.brq.redhat.com [10.40.200.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D179990F70;
 Tue, 18 Feb 2020 17:17:53 +0000 (UTC)
Date: Tue, 18 Feb 2020 18:17:51 +0100
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Message-ID: <20200218181751.1d7139d2@carbon>
In-Reply-To: <20200218141031.377860-1-ilias.apalodimas@linaro.org>
References: <20200218141031.377860-1-ilias.apalodimas@linaro.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 toke@redhat.com, John Fastabend <john.fastabend@gmail.com>, brouer@redhat.com,
 Alexei Starovoitov <ast@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, jonathan.lemon@gmail.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 lorenzo@kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next v4] net: page_pool: API cleanup
	and comments
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

T24gVHVlLCAxOCBGZWIgMjAyMCAxNjoxMDozMSArMDIwMApJbGlhcyBBcGFsb2RpbWFzIDxpbGlh
cy5hcGFsb2RpbWFzQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBGdW5jdGlvbnMgc3RhcnRpbmcgd2l0
aCBfXyB1c3VhbGx5IGluZGljYXRlIHRob3NlIHdoaWNoIGFyZSBleHBvcnRlZCwKPiBidXQgc2hv
dWxkIG5vdCBiZSBjYWxsZWQgZGlyZWN0bHkuIFVwZGF0ZSBzb21lIG9mIHRob3NlIGRlY2xhcmVk
IGluIHRoZQo+IEFQSSBhbmQgbWFrZSBpdCBtb3JlIHJlYWRhYmxlLgo+IAo+IHBhZ2VfcG9vbF91
bm1hcF9wYWdlKCkgYW5kIHBhZ2VfcG9vbF9yZWxlYXNlX3BhZ2UoKSB3ZXJlIGRvaW5nCj4gZXhh
Y3RseSB0aGUgc2FtZSB0aGluZyBjYWxsaW5nIF9fcGFnZV9wb29sX2NsZWFuX3BhZ2UoKS4gIExl
dCdzCj4gcmVuYW1lIF9fcGFnZV9wb29sX2NsZWFuX3BhZ2UoKSB0byBwYWdlX3Bvb2xfcmVsZWFz
ZV9wYWdlKCkgYW5kCj4gZXhwb3J0IGl0IGluIG9yZGVyIHRvIHNob3cgdXAgb24gcGVyZiBsb2dz
IGFuZCBnZXQgcmlkIG9mCj4gcGFnZV9wb29sX3VubWFwX3BhZ2UoKS4KPiAKPiBGaW5hbGx5IHJl
bmFtZSBfX3BhZ2VfcG9vbF9wdXRfcGFnZSgpIHRvIHBhZ2VfcG9vbF9wdXRfcGFnZSgpIHNpbmNl
IHdlCj4gY2FuIG5vdyBkaXJlY3RseSBjYWxsIGl0IGZyb20gZHJpdmVycyBhbmQgcmVuYW1lIHRo
ZSBleGlzdGluZwo+IHBhZ2VfcG9vbF9wdXRfcGFnZSgpIHRvIHBhZ2VfcG9vbF9wdXRfZnVsbF9w
YWdlKCkgc2luY2UgdGhleSBkbyB0aGUgc2FtZQo+IHRoaW5nIGJ1dCB0aGUgbGF0dGVyIGlzIHRy
eWluZyB0byBzeW5jIHRoZSBmdWxsIERNQSBhcmVhLgo+IAo+IFRoaXMgcGF0Y2ggYWxzbyB1cGRh
dGVzIG5ldHNlYywgbXZuZXRhIGFuZCBzdG1tYWMgZHJpdmVycyB3aGljaCB1c2UKPiB0aG9zZSBm
dW5jdGlvbnMuCj4gCj4gQWNrZWQtYnk6IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUBy
ZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IElsaWFzIEFwYWxvZGltYXMgPGlsaWFzLmFwYWxv
ZGltYXNAbGluYXJvLm9yZz4KCkxHVE0gLSBvbiBhIHF1aWNrIHJldmlldyAobm90IGNvbXBpbGUg
dGVzdGVkLi4uKS4KCkFja2VkLWJ5OiBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIDxicm91ZXJAcmVk
aGF0LmNvbT4KCj4gLS0tCj4gQ2hhbmdlcyBzaW5jZQo+IHYxOgo+IC0gRml4ZWQgbmV0c2VjIGRy
aXZlciBjb21waWxhdGlvbiBlcnJvcgo+IHYyOgo+IC0gSW1wcm92ZWQgY29tbWVudCBkZXNjcmlw
dGlvbiBvZiBwYWdlX3Bvb2xfcHV0X3BhZ2UoKQo+IHYzOgo+IC0gUHJvcGVybHkgZGVmaW5lIHBh
Z2VfcG9vbF9yZWxlYXNlX3BhZ2UoKSBpbiB0aGUgaGVhZGVyIGZpbGUKPiAgIHdpdGhpbiBhbiBp
ZmRlZiBzaW5jZSB4ZHAuYyB1c2VzIGl0IGV2ZW4gaWYgQ09ORklHX1BBR0VfUE9PTCBpcyBub3Qg
c2VsZWN0ZWQKPiAtIHJlbmFtZSBfX3BhZ2VfcG9vbF9jbGVhbl9wYWdlIC0+IHBhZ2VfcG9vbF9y
ZWxlYXNlX3BhZ2UgYW5kIGdldCByaWQgb2YKPiBhbm90aGVyIHJlZHVuZGFudCBoZWxwZXIKCi0t
IApCZXN0IHJlZ2FyZHMsCiAgSmVzcGVyIERhbmdhYXJkIEJyb3VlcgogIE1TYy5DUywgUHJpbmNp
cGFsIEtlcm5lbCBFbmdpbmVlciBhdCBSZWQgSGF0CiAgTGlua2VkSW46IGh0dHA6Ly93d3cubGlu
a2VkaW4uY29tL2luL2Jyb3VlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
