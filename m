Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 558B3160C52
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2020 09:08:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05F2FC36B0B;
	Mon, 17 Feb 2020 08:08:25 +0000 (UTC)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E630C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581849241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AyZPiWK74GL/snEzHEB39Hj1J71bF2CTXG08laECY4o=;
 b=AU7zjrKZs4CfcI2GTsVjKBtFrvU7obj2JjsNIGApETBD9dHmIYcjzP1F7TPHHm8p6MC5s7
 JacBADf+iU3AWju7BiZ/ix7PwRwQEL7pcbxlIgqp5q7bJAyDIjOUh83HLM74j7J5MxRoO6
 zBWiCX6fkMh6PJ/S1vz4/N2Ab1NTZTI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-YCzOExpIMGm627-1D1ZoFQ-1; Sun, 16 Feb 2020 05:33:59 -0500
Received: by mail-lf1-f72.google.com with SMTP id z3so1423732lfq.22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 02:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=AyZPiWK74GL/snEzHEB39Hj1J71bF2CTXG08laECY4o=;
 b=j5myKk3MIj0mXMx66d/M2lypSZKnNdTqhEnF2rPR5YJkUISdk958fzgzW+U97IxpUf
 MQaBzl3fEDfAl7GHesKjx8zusSEY8qVW6w+jn7TOoZQqruB126hvWArBXNNRmbgPu6vp
 ZY0GxbCTV6x28Lr1wk7EhXKzZA+bUM2+Ny61I/gW3NDoVihy+izM1YaKSMnWlRunzotf
 2Z96MFOLkHuSyuqEa9tPWdIYy0qmK1FCiLuFDdlSAckMrDCg7GhKwsfwiqD26D4ISPBz
 OVSC6YeWwl4Q4nTwAnyduSOO3v7gzQJf+Lee+Byo60wtBfID0k5nXpG4BIVHv5JvDO3C
 kcHg==
X-Gm-Message-State: APjAAAV3fAgX5qsw6zg917iCOqx5GVJ1tOMduRudyQwILV8S2nHc1iuP
 bnOf/2gHImQxgBBZEqtD0YpUEOqu06dVlmvThnlvixz4/vx9xN3lD5FD7RbJdhTftUCu5PuTPRH
 bflnVauXyZfAFxUpVCxqpl2Ji/+wzuoTkJ75Fp3Rm
X-Received: by 2002:ac2:5979:: with SMTP id h25mr5823555lfp.203.1581849237864; 
 Sun, 16 Feb 2020 02:33:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5CGpNlEjzA8D5rxS5gBw73IyHetdr4xNVSJIqqTnMYikH1e1wBtykq/V+h6jiwZNsqfmBaA==
X-Received: by 2002:ac2:5979:: with SMTP id h25mr5823536lfp.203.1581849237634; 
 Sun, 16 Feb 2020 02:33:57 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
 by smtp.gmail.com with ESMTPSA id a12sm6454240ljk.48.2020.02.16.02.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 02:33:56 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id DED0E180371; Sun, 16 Feb 2020 11:33:55 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>, netdev@vger.kernel.org
In-Reply-To: <20200216094056.8078-1-ilias.apalodimas@linaro.org>
References: <20200216094056.8078-1-ilias.apalodimas@linaro.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Sun, 16 Feb 2020 11:33:55 +0100
Message-ID: <87k14mbz3g.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: YCzOExpIMGm627-1D1ZoFQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:08:23 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, Jassi Brar <jaswinder.singh@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, jonathan.lemon@gmail.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 lorenzo@kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: page_pool: API cleanup and
	comments
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

SWxpYXMgQXBhbG9kaW1hcyA8aWxpYXMuYXBhbG9kaW1hc0BsaW5hcm8ub3JnPiB3cml0ZXM6Cgo+
IEZ1bmN0aW9ucyBzdGFydGluZyB3aXRoIF9fIHVzdWFsbHkgaW5kaWNhdGUgdGhvc2Ugd2hpY2gg
YXJlIGV4cG9ydGVkLAo+IGJ1dCBzaG91bGQgbm90IGJlIGNhbGxlZCBkaXJlY3RseS4gVXBkYXRl
IHNvbWUgb2YgdGhvc2UgZGVjbGFyZWQgaW4gdGhlCj4gQVBJIGFuZCBtYWtlIGl0IG1vcmUgcmVh
ZGFibGUuCj4KPiBwYWdlX3Bvb2xfdW5tYXBfcGFnZSgpIGFuZCBwYWdlX3Bvb2xfcmVsZWFzZV9w
YWdlKCkgd2VyZSBkb2luZwo+IGV4YWN0bHkgdGhlIHNhbWUgdGhpbmcuIEtlZXAgdGhlIHBhZ2Vf
cG9vbF9yZWxlYXNlX3BhZ2UoKSB2YXJpYW50Cj4gYW5kIGV4cG9ydCBpdCBpbiBvcmRlciB0byBz
aG93IHVwIG9uIHBlcmYgbG9ncy4KPiBGaW5hbGx5IHJlbmFtZSBfX3BhZ2VfcG9vbF9wdXRfcGFn
ZSgpIHRvIHBhZ2VfcG9vbF9wdXRfcGFnZSgpIHNpbmNlIHdlCj4gY2FuIG5vdyBkaXJlY3RseSBj
YWxsIGl0IGZyb20gZHJpdmVycyBhbmQgcmVuYW1lIHRoZSBleGlzdGluZwo+IHBhZ2VfcG9vbF9w
dXRfcGFnZSgpIHRvIHBhZ2VfcG9vbF9wdXRfZnVsbF9wYWdlKCkgc2luY2UgdGhleSBkbyB0aGUg
c2FtZQo+IHRoaW5nIGJ1dCB0aGUgbGF0dGVyIGlzIHRyeWluZyB0byBzeW5jIHRoZSBmdWxsIERN
QSBhcmVhLgo+Cj4gQWxzbyB1cGRhdGUgbmV0c2VjLCBtdm5ldGEgYW5kIHN0bW1hYyBkcml2ZXJz
IHdoaWNoIHVzZSB0aG9zZSBmdW5jdGlvbnMuCj4KPiBTdWdnZXN0ZWQtYnk6IEpvbmF0aGFuIExl
bW9uIDxqb25hdGhhbi5sZW1vbkBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSWxpYXMgQXBh
bG9kaW1hcyA8aWxpYXMuYXBhbG9kaW1hc0BsaW5hcm8ub3JnPgoKVGhhbmtzIGZvciB0aGUgaG91
c2UgY2xlYW5pbmcgOikKCkFja2VkLWJ5OiBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VA
cmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
