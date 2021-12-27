Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B238B47FC9A
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Dec 2021 13:25:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51C88C5F1F0;
	Mon, 27 Dec 2021 12:25:47 +0000 (UTC)
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58E96C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Dec 2021 12:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=IDsW1D37Ld46xZP1e1BCxe9r4t30B4LlBb5BPXrT7To=; b=DUkJPJnEAWw/LmOdoNNgVO152V
 v/rQDMm1dfBoKJPa5RbuYo20KhUz1J9FsobvRK3FZOL3BGrV3bB6ZW5b5kJWI+if8zHxIyAydpq09
 vJGVN8sB9FuUPpJepWT/4ROdMv7hhmMi5PVGP/sPqfyrptZugp7ZBiZClgEmnKDcEXOF/lyZrPzdu
 Jf1Jb9pYf62AOJtlB/nSAvybnS6J7aa1XYJ8iHE576t9T/VtJKwaBGC6RikJlEjsG+KT72IslP351
 BC47EcpEo4keuhzXICiMhd5HS+m0jxdNGa1EPZ+Az3Q6y+MfvBXgGK8jl4da8eGHJQ+rbNmcOQ+Me
 7+aXTdUw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1n1p4A-000BLW-B6; Mon, 27 Dec 2021 13:25:26 +0100
Received: from [2001:a61:2bc8:8501:9e5c:8eff:fe01:8578]
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1n1p49-0005Te-ON; Mon, 27 Dec 2021 13:25:25 +0100
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 William Breathitt Gray <vilhelm.gray@gmail.com>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <c8f6446e-748b-5845-ae60-5d6b8f3e8d39@metafoo.de>
Date: Mon, 27 Dec 2021 13:25:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26404/Mon Dec 27 10:34:40 2021)
Cc: Raymond Tan <raymond.tan@intel.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Patrick Havelange <patrick.havelange@essensium.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Kamel Bouhara <kamel.bouhara@bootlin.com>, Jonathan Corbet <corbet@lwn.net>,
 David Lechner <david@lechnology.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 "Felipe Balbi \(Intel\)" <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Oleksij Rempel <linux@rempel-privat.de>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 00/23] counter: cleanups and device
	lifetime fixes
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

T24gMTIvMjcvMjEgMTA6NDUgQU0sIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IFsuLi5dCj4K
PiAgIC0gSSB3b25kZXIgd2h5IGNvdW50ZXIgaXMgYSBidXMgYW5kIG5vdCBhIGNsYXNzIGRldmlj
ZSB0eXBlLiBUaGVyZSBpcwo+ICAgICBubyBkcml2ZXIgdGhhdCB3b3VsZCBldmVyIGJpbmQgYSBj
b3VudGVyIGRldmljZSwgaXMgdGhlcmU/IFNvCj4gICAgIC9zeXMvYnVzL2NvdW50ZXIvZHJpdmVy
IGlzIGFsd2F5cyBlbXB0eS4KPgpUaGVyZSB1c2VkIHRvIGJlIGEgdGltZSB3aGVuIEdLSCBzYWlk
IHRoYXQgd2UgZG8gbm90IHdhbnQgbmV3IGRyaXZlciAKY2xhc3Nlcy4gQW5kIGFsbCBuZXcgc3Vi
c3lzdGVtcyBzaG91bGQgdXNlIGJ1cyBzaW5jZSBidXMgaXMgYSBzdXBlcnNldCAKb2YgY2xhc3Mu
IFRoaXMgcmVzdHJpY3Rpb24gaGFzIGJlZW4gZWFzZWQgc2luY2UgdGhlbi4KCkJ1dCBpdCB3YXMg
YXJvdW5kIHdoZW4gdGhlIElJTyBzdWJzeXN0ZW0gd2FzIG1lcmdlZCBhbmQgc2luY2UgdGhlIApj
b3VudGVyIHN1YnN5c3RlbSBvcmlnaW5hdGVkIGZyb20gdGhlIElJTyBzdWJzeXN0ZW0gSSBhc3N1
bWUgaXQganVzdCAKY29waWVkIHRoaXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
