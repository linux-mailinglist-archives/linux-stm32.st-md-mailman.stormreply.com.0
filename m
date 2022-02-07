Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6554AC4ED
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 17:11:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BB7CC60465;
	Mon,  7 Feb 2022 16:11:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF5BFC60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 16:11:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2179FfGc007141;
 Mon, 7 Feb 2022 12:57:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wkola+8NHOUeci6BL9R7HWr0Ol8gFmoM9m2H0WsXXDU=;
 b=sXhijxibbheFKoQO5MsAVP3hEVT/FA1WLrm5HONuzT/QnD6h1m3XO/DobKDKsWlOhfH1
 tRFtHxPC+t7Ws/OWxG5zBkfp18apG7WN7mRB6WaYrllJPly9p/rK/H1+p441TQquX+6/
 +Z3XVO1Wa22x++0uA2b29EX1lARuXruUDnGqZKx7l3wyVqRFFZOVyyf8nDB5VVdUIDID
 eAeJxLI+9km+2aQW+aguC83wt0CB86xa0PpvjbISjiBXvoKQ8wfJupez0EjVVUzOgYsf
 v5PF/FATTD+TFeL/sFT18mHni2QHcgiBgRuELQuVGOX92dRtF7I8rB6BU5z44A05ug/r kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e30mxrtuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 12:57:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ABCBC10002A;
 Mon,  7 Feb 2022 12:57:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4FC42194D8;
 Mon,  7 Feb 2022 12:57:37 +0100 (CET)
Received: from [10.48.0.252] (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 7 Feb
 2022 12:57:37 +0100
Message-ID: <8e5057e7-62e4-bb94-8cd2-13517fd72ff2@foss.st.com>
Date: Mon, 7 Feb 2022 12:57:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20220201160506.348701-1-amelie.delaunay@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220201160506.348701-1-amelie.delaunay@foss.st.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_04,2022-02-07_02,2021-12-02_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/2] Add DMA and MDMA support on
	STM32MP13x SoC family
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

SGkgQW3DqWxpZQoKT24gMi8xLzIyIDE3OjA1LCBBbWVsaWUgRGVsYXVuYXkgd3JvdGU6Cj4gVGhp
cyBwYXRjaHNldCBlbmFibGVzIERNQTEgYW5kIERNQTIgcm91dGVkIG9uIERNQU1VWDEsIGFuZCBN
RE1BIG9uCj4gU1RNMzJNUDEzLgo+IAo+IEFtZWxpZSBEZWxhdW5heSAoMik6Cj4gICAgQVJNOiBk
dHM6IHN0bTMyOiBhZGQgRE1BMSwgRE1BMiBhbmQgRE1BTVVYMSBvbiBTVE0zMk1QMTN4IFNvQyBm
YW1pbHkKPiAgICBBUk06IGR0czogc3RtMzI6IGFkZCBNRE1BIG9uIFNUTTMyTVAxM3ggU29DIGZh
bWlseQo+IAo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDEzMS5kdHNpIHwgNTQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDU0IGluc2VydGlv
bnMoKykKPiAKClNlcmllcyBhcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpUaGFua3MKQWxleApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
