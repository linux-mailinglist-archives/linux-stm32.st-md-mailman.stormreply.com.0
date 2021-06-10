Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DDC3A2D5E
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 15:46:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EB66C58D5B;
	Thu, 10 Jun 2021 13:46:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07E94C57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 13:46:24 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ADfF2G011626; Thu, 10 Jun 2021 15:46:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wEEkWxXSfq66/leswbqmUsRSfaLtlKhzGDS4UuKrTTk=;
 b=MW7/lejI8Ni+q25Bdb5nP/0nlLSRcMzo0l04yr9y0FMZDdlFI5ncEuH5Pd6qzsxzcWg9
 sL6vzU5V9CMTWs5fDnoNYUPsCGRGwKsCSfbSaMUcbzCAv0Cn8NZiNgQb46Z9DD1J92qM
 zuJeX/MrTr1Vn37L6glaLFMtqoBGGwCPvrWx+dn6YDvkcfRFgJsBmWgeEbrqq8JTkGfJ
 V3/XgeU2S6AUsayfQZTTqzy75vfl58O5YeU0Tz0hNKiGodt/CseWn0AhRsHjNlrYK9oL
 hnuq7Ge0aGk03uoEEF+zlKsyng3R3NtkTH0Q1/PzhdmBxJkpNYfRL5dM52MtWGHZr5Wy 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 393eqyj1uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 15:46:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 274CD10002A;
 Thu, 10 Jun 2021 15:46:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 093B2228838;
 Thu, 10 Jun 2021 15:46:11 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 15:46:10 +0200
To: Grzegorz Szymaszek <gszymaszek@short.pl>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Marcin
 Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <YLj4AMTCi84yO9GO@nx64de-df6d00>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <af63b0d2-fce7-1e29-e36e-02da08f14d83@foss.st.com>
Date: Thu, 10 Jun 2021 15:46:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YLj4AMTCi84yO9GO@nx64de-df6d00>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_07:2021-06-10,
 2021-06-10 signatures=0
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix the Odyssey SoM eMMC
	VQMMC supply
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

SGkKCk9uIDYvMy8yMSA1OjQwIFBNLCBHcnplZ29yeiBTenltYXN6ZWsgd3JvdGU6Cj4gVGhlIFNl
ZWVkIFNvTS1TVE0zMk1QMTU3QyBkZXZpY2UgdHJlZSBoYWQgdGhlIGVNTUPigJlzIChTRE1NQzIp
IFZRTU1DCj4gc3VwcGx5IHNldCB0byB2M3YzIChidWNrNCksIHRoZSBzYW1lIGFzIHRoZSBWTU1D
IHN1cHBseS4gVGhhdCB3YXMKPiBpbmNvcnJlY3QsIGFzIG9uIHRoZSBTb00sIHRoZSBWUU1NQyBz
dXBwbHkgaXMgcHJvdmlkZWQgZnJvbSB2ZGQgKGJ1Y2szKQo+IGluc3RlYWQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogR3J6ZWdvcnogU3p5bWFzemVrIDxnc3p5bWFzemVrQHNob3J0LnBsPgo+IC0tLQo+
ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaSB8IDIgKy0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNp
IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaQo+IGluZGV4
IDZjZjQ5YTBhOWU2OS4uYjU2MDFkMjcwYzhmIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kKPiArKysgYi9hcmNoL2FybS9ib290L2R0
cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpCj4gQEAgLTI2OSw3ICsyNjksNyBAQCAmc2Rt
bWMyIHsKPiAgIAlzdCxuZWctZWRnZTsKPiAgIAlidXMtd2lkdGggPSA8OD47Cj4gICAJdm1tYy1z
dXBwbHkgPSA8JnYzdjM+Owo+IC0JdnFtbWMtc3VwcGx5ID0gPCZ2M3YzPjsKPiArCXZxbW1jLXN1
cHBseSA9IDwmdmRkPjsKPiAgIAltbWMtZGRyLTNfM3Y7Cj4gICAJc3RhdHVzID0gIm9rYXkiOwo+
ICAgfTsKPiAKCkFwcGxpZWQgb24gc3RtMzItbmV4dC4KClRoYW5rcy4KQWxleApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
