Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07440506D72
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 15:29:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC253C6049A;
	Tue, 19 Apr 2022 13:29:01 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F6C2C60494
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 13:28:59 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 u5-20020a17090a6a8500b001d0b95031ebso1865198pjj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 06:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Gt27EbYhS9qJA9bFo3ES5TQ+M3mPhDrTTHCzoFmARGI=;
 b=TTITMF5ldzsjryyA1haYULWZJcPqXxNnxjg6fUuS4q+E+uNztjSeFm4paslPCdU0jl
 igaZQz3FSbN5pJAn9HDmXgRFlNZHLb7pdQuVaiNzCkYJXMPPsTRvlrURIrhIy4f2Mr61
 maW3029xdqGfPgmZ5lPQqeUuxy+01b5JPdF0imZ5Vtbf781uDccF3xvUaS99bZ7AUCCr
 +5765Eq6OP5kSX1kgpjCdDsWztWt3dv2nBq5DJvkqmCpEeNM+w794/gYgait+tSTggE5
 DyuMiwtz7R0IGqma+H+kPPu6ebQl68B75LB2iXtNSR8TsiBiRqSqAdwDvcr/B+S1S3W2
 TFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Gt27EbYhS9qJA9bFo3ES5TQ+M3mPhDrTTHCzoFmARGI=;
 b=KmBcPQ5nx66TyAc43JWbExoXOjhh7uUAAyjt5RHBvWCgZbc0PPWuksmYngTCxweMEt
 XtPGgA/fGRWiWhaPV9NM38RYCusVawkjvJUrqFtjx0OuYBQty4N3UGwSjxzDuTis5U7E
 gs9bAzaGRUUIHDCKwKpQ0gCWKItCviAF5/c+MlQuFyAQhizSAiR8wXOshg6cqdj/e4KW
 dXbSm49jLPdfAHgOOH35VJQVzcEfyAJJW7ZDJBWRzmKOISnpc6EwsptxqBa3ZIe0gNz1
 ElHNodaVowa3hhYw89pIbMPjtGGIbB0q6bbU2FKse2TcEy82cfrS676imPrsa4xomFeu
 yIpw==
X-Gm-Message-State: AOAM533dSGwIg9kpqKeme8pDuZvFx3fJOhEzNju1+P7gpg5mPRb5docM
 HjHrWDRkCSAVJ6iPTP4URl0=
X-Google-Smtp-Source: ABdhPJy6cH5/4e6XZZ4pT4pDqRzujdx8zF5e9ofQmq+fjlHAC4ig/75jn3fViJjD1vhmejDhoMsn2g==
X-Received: by 2002:a17:902:8483:b0:158:f833:b7a4 with SMTP id
 c3-20020a170902848300b00158f833b7a4mr10702309plo.100.1650374938037; 
 Tue, 19 Apr 2022 06:28:58 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8200:33:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a634a50000000b003a82190a495sm10071714pgl.62.2022.04.19.06.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 06:28:56 -0700 (PDT)
Date: Tue, 19 Apr 2022 06:28:53 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Tan Tee Min <tee.min.tan@linux.intel.com>
Message-ID: <20220419132853.GA19386@hoboy.vegasvil.org>
References: <20220413040115.2351987-1-tee.min.tan@intel.com>
 <20220413125915.GA667752@hoboy.vegasvil.org>
 <20220414072934.GA10025@linux.intel.com>
 <20220414104259.0b928249@kernel.org>
 <20220419005220.GA17634@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419005220.GA17634@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Song Yoong Siang <yoong.siang.song@intel.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Tan Tee Min <tee.min.tan@intel.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: add fsleep() in HW
 Rx timestamp checking loop
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

T24gVHVlLCBBcHIgMTksIDIwMjIgYXQgMDg6NTI6MjBBTSArMDgwMCwgVGFuIFRlZSBNaW4gd3Jv
dGU6Cgo+IEkgYWdyZWUgdGhhdCB0aGUgZnNsZWVwKDEpICg9MXVzKSBpcyBhIGJpZyBoYW1tZXIu
Cj4gVGh1cyBpbiBvcmRlciB0byBpbXByb3ZlIHRoaXMsIEnigJl2ZSBmaWd1cmVkIG91dCBhIHNt
YWxsZXIgZGVsYXkKPiB0aW1lIHRoYXQgaXMgZW5vdWdoIGZvciB0aGUgY29udGV4dCBkZXNjcmlw
dG9yIHRvIGJlIHJlYWR5IHdoaWNoCj4gaXMgbmRlbGF5KDUwMCkgKD01MDBucykuCgpXaHkgaXNu
J3QgdGhlIGNvbnRleHQgZGVzY3JpcHRvciByZWFkeT8KCkkgbWVhbiwgdGhlIGZyYW1lIGFscmVh
ZHkgYmVsb25ncyB0byB0aGUgQ1BVLCByaWdodD8KClRoYW5rcywKUmljaGFyZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
