Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3DE611AA2
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Oct 2022 21:07:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 495EBC640F9;
	Fri, 28 Oct 2022 19:07:23 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D74BC63324
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 19:07:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CD718CE2D49;
 Fri, 28 Oct 2022 19:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C90EC433D6;
 Fri, 28 Oct 2022 19:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666984037;
 bh=ervC6ARXQQ75MdsA8OL4ZgPAvhRgLXYEJOmpIVIk9PM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qwa3QUBIxYIkqpBLAMz/CoVKnJAFJXovNuQS/JLnNFs/AG7S6ecUM7qigbU1RR3mW
 rt/2eRXhC8dL7JbaSkpNm8nllgm2HFuBOv+1nLMJS/7cmDcLPHdW40S1TKCqM6rzw2
 SzwFkZGy39njtqwYKWE6GF9QrFEwJVEs++PZjg9WKLH9lh+L523Pv46M99D42iQvrH
 iADFqBUmfHsbxohiTk6yCF4w3S/iVC07TpjgYfmaQZp0UXZDoaAzcayuhjRG2KYRZS
 lUip+9CcEGBI66zyMMwQng3dPaWnM+EIWeoknK8oU5SXtUmKEcIPzHgPlWlrHb2ymi
 amolGhv3ciRLg==
Date: Fri, 28 Oct 2022 12:07:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Message-ID: <20221028120715.1dc12fc1@kernel.org>
In-Reply-To: <DM5PR11MB15935E3AF06794F523DB48C69D329@DM5PR11MB1593.namprd11.prod.outlook.com>
References: <A23A7058-5598-46EB-8007-C401ADC33149@apple.com>
 <DM5PR11MB15935E3AF06794F523DB48C69D329@DM5PR11MB1593.namprd11.prod.outlook.com>
MIME-Version: 1.0
Cc: "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "Gan, Yi
 Fang" <yi.fang.gan@intel.com>, "Voon, Weifeng" <weifeng.voon@intel.com>, "Song,
 Yoong Siang" <yoong.siang.song@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Tan,
 Tee Min" <tee.min.tan@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Vee Khee Wong <veekhee@apple.com>,
 "edumazet@google.com" <edumazet@google.com>, "Looi, 
 Hong Aun" <hong.aun.looi@intel.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, "Zulkifli,
 Muhammad Husaini" <muhammad.husaini.zulkifli@intel.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: Separate
 ADL-N and RPL-P device ID from TGL
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

T24gRnJpLCAyOCBPY3QgMjAyMiAxMDo0NDoyNCArMDAwMCBTaXQsIE1pY2hhZWwgV2VpIEhvbmcg
d3JvdGU6Cj4gVGhpcyBpcyB0byBhbGxvdyBmaW5lciBjb250cm9sIG9uIHBsYXRmb3JtIHNwZWNp
ZmljIGZlYXR1cmVzIGZvciBBREwgYW5kIFJQTC4KPiBUaGVyZSBhcmUgc29tZSBmZWF0dXJlcyB0
aGF0IEFETCBhbmQgUlBMIGRvZXNu4oCZdCBzdXBwb3J0IGFuZCBUR0wgc3VwcG9ydHMgdmljZSB2
ZXJzYS4KCkJ1dCBpZiB0aGV5IGFyZSB0aGUgc2FtZSBfcmlnaHRfIF9ub3dfIHdoYXQncyB0aGUg
cG9pbnQ/ClBsZWFzZSByZXBvc3QgYXMgcGFydCBvZiBhIHNlcmllcyB3aGljaCBhY3R1YWxseSBt
b2RpZmllcwp0aGUgY29udGVudHMuCgpQbGVhc2UgcmVtZW1iZXIgbm90IHRvIHRvcCBwb3N0IG9u
IHRoZSBNTC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
