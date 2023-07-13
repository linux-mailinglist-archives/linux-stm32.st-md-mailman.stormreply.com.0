Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0FB751AA3
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 10:00:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 698BBC6B452;
	Thu, 13 Jul 2023 08:00:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DF89C6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 08:00:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36D7NZTv002471; Thu, 13 Jul 2023 09:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : cc : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=G/5P+GBYTXDjapoJpeo3kbVedPpgVPQ0maCG9CHv5+Q=;
 b=HWz26JpNsdDJbJQoAb+xal5sc8dUbPMpZmAR/YzfV2icOKFol1B4tnKWHatZblUVB8+h
 uRuScfuCSr4bG0QgV3S8E/DnOY9EC5a3kZl9B91ZbRRPhrk9MDijmBHIhXdm+9DLYEJB
 1/0sCeQUmsVZsiBc9azZcemNaAs3fbScUqJFlmPRoecUmqWfvwdd6EE7BeKV2VI5G9mv
 BOijjoSqYCpU8NnL3CJZJEq2Xmt1SEaizoKqgTd7jd+I7+A4/0q8WpryHJEtR54Id8rB
 v5qU7/jAUzEqZ6LWd17pu4xzRqA/3HIqxlOX0GqHXApIwd2EveX4xIwj5Wipm7Z7vlNb Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rtcud08ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 09:59:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB4FC100058;
 Thu, 13 Jul 2023 09:59:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3B922138CC;
 Thu, 13 Jul 2023 09:59:49 +0200 (CEST)
Received: from [10.201.22.9] (10.201.22.9) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 13 Jul
 2023 09:59:49 +0200
Message-ID: <050aa1fb-34ab-b9e0-7772-af53ec32d312@foss.st.com>
Date: Thu, 13 Jul 2023 09:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230706073719.1156288-1-thomas.bourgoin@foss.st.com>
 <20230706073719.1156288-3-thomas.bourgoin@foss.st.com>
 <CACRpkdaHn8fhZtuhU4sXHK1xoxO3-xYg_Xb=3=bX8i-uJM9KDA@mail.gmail.com>
 <a584c152-329e-9c79-ec62-795485302a55@foss.st.com>
 <CACRpkdYStm_dxo-FMo4Kdw_Lm3iG+xppf7O5W6cxtoiRy1DOsw@mail.gmail.com>
From: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
In-Reply-To: <CACRpkdYStm_dxo-FMo4Kdw_Lm3iG+xppf7O5W6cxtoiRy1DOsw@mail.gmail.com>
X-Originating-IP: [10.201.22.9]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_04,2023-07-11_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/7] crypto: stm32 - add new algorithms
	support
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

SGkgTGludXMsCgpPbiA3LzEzLzIzIDAwOjU2LCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IFllcyB0
aGlzIGZpeGVzIHRoZSBidWcgYW5kIHRoZSB0ZXN0cyBwYXNzIGZpbmUg8J+YhAoKR3JlYXQgbmV3
cwoKPiBJIHdvbmRlciB3aHkgU0hBMSB3YXMgYWZmZWN0ZWQ/IFNhbWUgY29kZXBhdGg/CgpZZXMg
dGhlIG51bWJlciBvZiBDU1IgdG8gc2F2ZSBpcyB0aGUgc2FtZSBmb3IgU0hBMjU2IGFuZCBTSEEx
LiBZb3UgY2FuIApsb29rIGF0IHRoZSAnQ29udGV4dCBzd2FwcGluZycgY2hhcHRlciAoNDcuMy4z
KSBpbiB0aGUgcmVmZXJlbmNlIG1hbnVhbCAKZm9yIFVYNTAwLiBUaGVyZSBpcyBhIG5vdGUgYXQg
dGhlIGVuZCB0ZWxsaW5nIHRoYXQgeW91IGRvIG5vdCBoYXZlIHRvIApzYXZlIGFsbCA1NCByZWdp
c3RlciBpZiB5b3UgZG8gSEFTSCBvcGVyYXRpb24sIG9ubHkgMzggYXJlIG5lY2Vzc2FyeSA6CiAg
PiBJZiB0aGUgY29udGV4dCBzd2FwIGRvZXMgbm90IGludm9sdmUgSE1BQyBvcGVyYXRpb25zLCBy
ZWdpc3RlcnMgCmNzX3JrMCB0byBjc19yazcgYW5kCj4gY3NfcmgwIHRvIGNzX3JoNyBjYW4gYmUg
aWdub3JlZApCZXN0IHJlZ2FyZHMsCgpUaG9tYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
