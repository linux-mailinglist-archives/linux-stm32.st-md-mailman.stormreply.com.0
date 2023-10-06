Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B12837BBF09
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 20:52:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C271C6A613;
	Fri,  6 Oct 2023 18:52:59 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A76E1C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 18:52:58 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-32167a4adaaso2156546f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Oct 2023 11:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696618378; x=1697223178;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X70lVOFCcfRrz5BPTne6oD5pXVKA4lkjxXDB0TaolDY=;
 b=Mku/HA/On/W7r1YbJYyVkRiFp+YZu1yyyoBhPHNB+W/5Rfj5lnjYLiMv++kZxqtskb
 uGVp4murEVdksao68qEK1KpJC5/ZDNig6Ez7pA1A9bJXie9NsYkwWfjbDVvE/xbb8LFd
 ML98JZBVwt5CrWWvpC2obA3Z6ii4YIp2QvOTDJTaiU0KTbbzkmKH5ik19aW9H9bFeyOx
 fP8xz2nPHVuKQZWornE+vjZ8s/Ael3Tx8d4jH2rJj5lrPkG/Tt+Q7E27gcyi7Pjztle9
 Y0CKZ52U50mQrfa6jQ13xgPGR6VMf3Hs96RHFBdiUqtwZml3acsDjqLBMvve3RHsnAfI
 MlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696618378; x=1697223178;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X70lVOFCcfRrz5BPTne6oD5pXVKA4lkjxXDB0TaolDY=;
 b=mg9JaEhMjhJQpN9CFN4xhKkkVaHpg7SKI1hEQDphTA6YoycYB+wpe/3c22T0s3++b+
 WxcA8tQP/rdvP74sFRt3KTHbrzlI90UD2eODCSDDNCy+NuPEzXelP/n9Eo2Ub3iOzaGT
 kr/RR9QERGGltM1eAokfdKvcrbEqj7Uw5ZWqiM+tYbq7Lj0lj2WwBVK6LtRyCbOzmYLZ
 hLxBuCm7CZR4EeYAeJh+EiHhQL4wStErsgIKQsJNkzex5H6a2hUOGhhNmPA0xObs2jxF
 jFH7tGDwcSnoX5c1rmLC9eCu8/uTsPYIYC8AjQI7f9KD6Y7vFhX9eRaqFmGtkjXMfAiW
 GCIg==
X-Gm-Message-State: AOJu0YyNmLSvig174FhU402L7h8g8YDObaXS8oaZR6e8T75pBM7kEOaz
 9mn7N/49gQ0pd/UueFgcEgY=
X-Google-Smtp-Source: AGHT+IG8xdl5PYYzmkg371/9IVLxOcEUg0/AO4c3FMmCpHBI1rBYraaud13cZvVNCZmgDH81LCr6PA==
X-Received: by 2002:a5d:4d8e:0:b0:324:7bdd:678e with SMTP id
 b14-20020a5d4d8e000000b003247bdd678emr7728648wru.60.1696618377892; 
 Fri, 06 Oct 2023 11:52:57 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a5d5489000000b003179d5aee67sm2231805wrv.94.2023.10.06.11.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 11:52:57 -0700 (PDT)
Message-ID: <65205789.5d0a0220.7e49b.ccb0@mx.google.com>
X-Google-Original-Message-ID: <ZSBXiecYhFuSdjkC@Ansuel-xps.>
Date: Fri, 6 Oct 2023 20:52:57 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
 <20231003145150.2498-3-ansuelsmth@gmail.com>
 <CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com>
 <20231005093253.2e25533a@kernel.org>
 <CANn89iJQ50AdXP2C1YB2pGjE02WCJ-QCsZqE1yGXtcGsfLA0Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89iJQ50AdXP2C1YB2pGjE02WCJ-QCsZqE1yGXtcGsfLA0Jw@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>,
 Rick Lindsley <ricklind@linux.ibm.com>, Krzysztof Halasa <khalasa@piap.pl>,
 Yuri Karpov <YKarpov@ispras.ru>, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, Dany Madden <danymadden@us.ibm.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Zhengchao Shao <shaozhengchao@huawei.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>,
 Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Lee Jones <lee@kernel.org>,
 Haren Myneni <haren@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>,
 Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Benjamin Berg <benjamin.berg@intel.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Coco Li <lixiaoyan@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Zheng Zengkai <zhengzengkai@huawei.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Douglas Miller <dougmill@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Tariq Toukan <tariqt@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Junfeng Guo <junfeng.guo@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next PATCH v2 3/4] netdev: replace
 napi_reschedule with napi_schedule
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

T24gVGh1LCBPY3QgMDUsIDIwMjMgYXQgMDY6NDE6MDNQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIFRodSwgT2N0IDUsIDIwMjMgYXQgNjozMuKAr1BNIEpha3ViIEtpY2luc2tpIDxr
dWJhQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgNSBPY3QgMjAyMyAxODoxMTo1
NiArMDIwMCBFcmljIER1bWF6ZXQgd3JvdGU6Cj4gPiA+IE9LLCBidXQgSSBzdXNwZWN0IHNvbWUg
dXNlcnMgb2YgbmFwaV9yZXNjaGVkdWxlKCkgbWlnaHQgbm90IGJlIHJhY2UtZnJlZS4uLgo+ID4K
PiA+IFdoYXQncyB0aGUgcmFjZSB5b3UncmUgdGhpbmtpbmcgb2Y/Cj4gCj4gVGhpcyBzb3J0IG9m
IHRoaW5nLi4uIHRoZSByYWNlIGlzIGluIGZsX3N0YXJ2aW5nKCkgdGhvdWdoLi4uCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjQvc2dlLmMKPiBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjQvc2dlLmMKPiBpbmRleCA5OGRkNzg1NTFk
ODkuLmI1ZmYyZTFhOTk3NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jaGVs
c2lvL2N4Z2I0L3NnZS5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdi
NC9zZ2UuYwo+IEBAIC00MjYxLDcgKzQyNjEsNyBAQCBzdGF0aWMgdm9pZCBzZ2VfcnhfdGltZXJf
Y2Ioc3RydWN0IHRpbWVyX2xpc3QgKnQpCj4gCj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYg
KGZsX3N0YXJ2aW5nKGFkYXAsIGZsKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcnhxID0gY29udGFpbmVyX29mKGZsLCBzdHJ1Y3Qgc2dlX2V0aF9yeHEsIGZsKTsKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChuYXBpX3Jlc2NoZWR1bGUoJnJ4cS0+cnNw
cS5uYXBpKSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChuYXBpX3NjaGVk
dWxlKCZyeHEtPnJzcHEubmFwaSkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZsLT5zdGFydmluZysrOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZWxzZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXRfYml0KGlk
LCBzLT5zdGFydmluZ19mbCk7CgpFaGhoIHByb2JsZW0gaXMgdGhhdCB0aGlzIGlzIGEgc2ltcGxl
IHJlbmFtZSBzbyBpZiBhbnkgcmFjZSBpcyBwcmVzZW50LAppdCdzIGFscmVhZHkgdGhlcmUgYW5k
IG5vdCBjYXVzZWQgYnkgdGhpcyByZW5hbWUgOigKCkRvbid0IGtub3cgbWF5YmUgdGhpcyBpcyBv
dXQgb2Ygc2NvcGUgYW5kIHNob3VsZCBiZSBpbnZlc3RpZ2F0ZWQgd2l0aCBhCmJ1ZyByZXBvcnQ/
CgpNYXliZSB0aGlzIHNob3VsZCBiZSBjaGFuZ2VkIHRvIHByZXAvX19zY2hlZHVsZSB0byBwcmV2
ZW50IGFueSBraW5kIG9mCnJhY2U/IEJ1dCBkb2luZyBzbyBkb2Vzbid0IHByZXZlbnQgYW55IGtp
bmQgb2YgIiJzdGFydmluZyIiPwoKLS0gCglBbnN1ZWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
