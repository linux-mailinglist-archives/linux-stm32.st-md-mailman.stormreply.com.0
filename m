Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA834AD407
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Feb 2022 09:52:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1CF5C5E2CC;
	Tue,  8 Feb 2022 08:52:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45046C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Feb 2022 08:52:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2187FPYI029207;
 Tue, 8 Feb 2022 09:52:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=v3Nw6M+6Dsi+fs1JPP1dSSIm9lpFQHB7g75gslpbKeY=;
 b=Mgq5P9NB3nwoHZdVJ6tMjysBImyErUzr19msvPqqz/FQ5su4diuk4I96fqnfOhnwlDhv
 lB7cKCACz3Sc6atiQ8xnt6n52YdWoAJh2M+QrQqiCwt9NoCNku+bZwbyjSulSmTUWgxR
 i1KICRpFL5346yegj5hlh6oEk9gNN2NWdxRAETo4tqc+QUE0ejJARTpaCkMkNGlgqGNM
 49v0iGD21x+9DC1dQ9KuskABfbYRzmuWZUmR37xtkwCz4/u/9P0VldiHLtEXU/htZ3Q1
 WnZ4MJliElInn3GE4UIJge/z8id89T9piEoLjrMVCEJkxSREAs1fUx/VSKF7cXwDFMT+ xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e3kyhgmje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 09:52:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B7C1A10002A;
 Tue,  8 Feb 2022 09:52:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A885E211F3D;
 Tue,  8 Feb 2022 09:52:33 +0100 (CET)
Received: from [10.129.7.145] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 8 Feb
 2022 09:52:33 +0100
Message-ID: <4f666fe5-080e-6c82-5bef-c0b52cb57207@foss.st.com>
Date: Tue, 8 Feb 2022 09:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
References: <20220207165304.1046867-1-nathan@kernel.org>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20220207165304.1046867-1-nathan@kernel.org>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: Avoid using val uninitialized in
 ltdc_set_ycbcr_config()
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

SGVsbG8gTmF0aGFuLAoKCk9uIDIvNy8yMiAxNzo1MywgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6
Cj4gQ2xhbmcgd2FybnM6Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jOjYyNToyOiB3
YXJuaW5nOiB2YXJpYWJsZSAndmFsJyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQgd2hlbmV2ZXIgc3dp
dGNoIGRlZmF1bHQgaXMgdGFrZW4gWy1Xc29tZXRpbWVzLXVuaW5pdGlhbGl6ZWRdCj4gICAgICAg
ICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgIF5+fn5+fn4KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0v
bHRkYy5jOjYzNToyOiBub3RlOiB1bmluaXRpYWxpemVkIHVzZSBvY2N1cnMgaGVyZQo+ICAgICAg
ICAgICB2YWwgfD0gTHhQQ1JfWUNFTjsKPiAgICAgICAgICAgXn5+Cj4gICBkcml2ZXJzL2dwdS9k
cm0vc3RtL2x0ZGMuYzo2MDA6OTogbm90ZTogaW5pdGlhbGl6ZSB0aGUgdmFyaWFibGUgJ3ZhbCcg
dG8gc2lsZW5jZSB0aGlzIHdhcm5pbmcKPiAgICAgICAgICAgdTMyIHZhbDsKPiAgICAgICAgICAg
ICAgICAgIF4KPiAgICAgICAgICAgICAgICAgICA9IDAKPiAgIDEgd2FybmluZyBnZW5lcmF0ZWQu
Cj4KPiBVc2UgYSByZXR1cm4gaW5zdGVhZCBvZiBicmVhayBpbiB0aGUgZGVmYXVsdCBjYXNlIHRv
IGZpeCB0aGUgd2FybmluZy4KPiBBZGQgYW4gZXJyb3IgbWVzc2FnZSBzbyB0aGF0IHRoaXMgcmV0
dXJuIGlzIG5vdCBzaWxlbnQsIHdoaWNoIGNvdWxkIGhpZGUKPiBpc3N1ZXMgaW4gdGhlIGZ1dHVy
ZS4KPgo+IEZpeGVzOiA0ODRlNzJkMzE0NmIgKCJkcm0vc3RtOiBsdGRjOiBhZGQgc3VwcG9ydCBv
ZiB5Y2JjciBwaXhlbCBmb3JtYXRzIikKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdC
dWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xNTc1Cj4gU2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5j
ZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0
ZGMuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCgpSZXZpZXdlZC1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlz
LXBvdUBmb3NzLnN0LmNvbT4KCgpUaGFua3MsCgpSYXBoYcOrbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
