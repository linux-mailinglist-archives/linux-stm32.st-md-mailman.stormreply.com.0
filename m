Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2B47B6653
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 12:25:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6708EC6B478;
	Tue,  3 Oct 2023 10:25:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E6B6C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Oct 2023 10:25:52 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40572aeb6d0so7062185e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Oct 2023 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696328752; x=1696933552;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UJbPLQ2sJq+JdJneKcIjpXN6+YXEeaAlp1ihUjhH9nY=;
 b=f0R7hkrkdJ9Ukw2Kvg9XvKYidL1aAw9YX5dCyPapv1Z5ABhCB2P95qjg44mbVp9MxN
 ahG0ZrAPS+6NhwQtvAfVAzqDCwcaAweF9ekleLCryOaw1fstmhYB5Y4CEbxHJbLe7MaJ
 5IBhNf/ItGFTEvUiklk90bCifrYWwS9OI+Gdh/x3LFkGuzQYGZ94nxwvOW5numHMfBEU
 jqTAH396nU502EustK3ta1gsoNINJIhsu/H55m8zLywgvzfFYPU1tFypRqpDrX5vFovo
 x1lM1kA07WEzFcLeUrcE0/ge1jZTMit5//MBF7F0MDJccvSomUpdIwLGUECNZM/nnKMl
 nmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696328752; x=1696933552;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UJbPLQ2sJq+JdJneKcIjpXN6+YXEeaAlp1ihUjhH9nY=;
 b=CZ6OZ0pewZHqUlezHRerER452mCVF7uY91iWR1xLW52YOeAbPZB24m+b/U1aDmEvGh
 ufjfTHOxbiXnf7PoNOfj2q+sCWXWGXzqnz3aoFDhAotGUKePqNDLOqRcyli2wN957GK/
 hcuD3J17ULvCckKUAgLfc25rdtDRgX1lApsgO0CiGIkfX7fSDMYsEvLwIh00LUkftVBQ
 Vocjp0ImhPDvvw5+SH3ITrILhK9YnTNtYTZZ/GSAGNzFmsTP65NyWd72HHOtEMVWgi2A
 i0TqU7WgZUPjQML0Fx9kiOu8Dlji7sQ8pzU/iyiZ29w2q9q5pM2/Alw+5TQ+Gv6OuY7q
 a96A==
X-Gm-Message-State: AOJu0Yw3IyHeGEtvGr9MJF0N+2NkAhNwL16FwzawIcS3tv0lmP/Rvd4n
 v7rRB/dStPCw8aULT+Xwg8c=
X-Google-Smtp-Source: AGHT+IH4PtfHldj0VvMZI/On+6s7VpV7CIQtUMLRVRfnUnG2AW04zeibvBdNxyG/QoznL6yrZAPK7w==
X-Received: by 2002:a1c:7c0b:0:b0:405:3885:490a with SMTP id
 x11-20020a1c7c0b000000b004053885490amr12474883wmc.0.1696328751231; 
 Tue, 03 Oct 2023 03:25:51 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
 by smtp.gmail.com with ESMTPSA id
 17-20020a05600c021100b004063cced50bsm945150wmi.23.2023.10.03.03.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 03:25:50 -0700 (PDT)
Message-ID: <651bec2e.050a0220.f5ddb.3810@mx.google.com>
X-Google-Original-Message-ID: <ZRvsKwrdSOI43YWZ@Ansuel-xps.>
Date: Tue, 3 Oct 2023 12:25:47 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
 <20231002151023.4054-2-ansuelsmth@gmail.com>
 <CANn89i+eSWYuE=wE1TPJFtAS1OCfFYytC_nAjDWkizxmR9e6JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89i+eSWYuE=wE1TPJFtAS1OCfFYytC_nAjDWkizxmR9e6JQ@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>,
 Rick Lindsley <ricklind@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Krzysztof Halasa <khalasa@piap.pl>, Yuri Karpov <YKarpov@ispras.ru>,
 Lee Jones <lee@kernel.org>, Dany Madden <danymadden@us.ibm.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Zhengchao Shao <shaozhengchao@huawei.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>,
 Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Haren Myneni <haren@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>,
 Jose Abreu <joabreu@synopsys.com>, Alex Elder <elder@linaro.org>,
 linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>,
 Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Bailey Forrest <bcf@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-can@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Benjamin Berg <benjamin.berg@intel.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Zheng Zengkai <zhengzengkai@huawei.com>, netdev@vger.kernel.org,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Douglas Miller <dougmill@linux.ibm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Junfeng Guo <junfeng.guo@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Johannes Berg <johannes@sipsolutions.net>, ath10k@lists.infradead.org,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next PATCH 2/4] netdev: make napi_schedule
 return bool on NAPI successful schedule
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

T24gVHVlLCBPY3QgMDMsIDIwMjMgYXQgMDc6MjE6NDZBTSArMDIwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIE1vbiwgT2N0IDIsIDIwMjMgYXQgNToxMOKAr1BNIENocmlzdGlhbiBNYXJhbmdp
IDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQ2hhbmdlIG5hcGlfc2NoZWR1
bGUgdG8gcmV0dXJuIGEgYm9vbCBvbiBOQVBJIHN1Y2Nlc3NmdWwgc2NoZWR1bGUuIFRoaXMKPiA+
IG1pZ2h0IGJlIHVzZWZ1bCBmb3Igc29tZSBkcml2ZXIgdG8gZG8gYWRkaXRpb25hbCBzdGVwIGFm
dGVyIGEgTkFQSSBhaHMKPiAKPiBUaGlzIG1pZ2h0IGJlIHVzZWZ1bCBmb3Igc29tZSBkcml2ZXJz
IHRvIGRvIGFkZGl0aW9uYWwgc3RlcHMgYWZ0ZXIgYQo+IE5BUEkgaGFzIGJlZW4gc2NoZWR1bGVk
Lgo+IAo+ID4gYmVlbiBzY2hlZHVsZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IAo+IFllYWgsIEkgZ3Vlc3MgeW91IGZv
cmdvdCB0byBtZW50aW9uIEkgc3VnZ2VzdGVkIHRoaXMgcGF0Y2ggLi4uCj4gCj4gUmV2aWV3ZWQt
Ynk6IEVyaWMgRHVtYXpldCA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT4KClllcyBzb3JyeSwgdG90YWxs
eSBmb3Jnb3QgdG8gYWRkIHRoaXMgaGVyZS4gSSBhbHJlYWR5IGhhdmUgdGhlIHBhdGNoIGZvciB0
aGUKb3RoZXIgZHJpdmVyIChidXQgaXQncyBkZXBlbmRhbnQgb24gdGhpcyBzbyBJJ20gd2FpdGlu
ZykgYW5kIEkgZm9yZ290IHRvCmFkZCB0aGUgdGFnIGFsc28gZm9yIHRoaXMgcGllY2UuCgotLSAK
CUFuc3VlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
