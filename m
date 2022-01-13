Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F76C48D535
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jan 2022 11:00:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ADAFC5F1F5;
	Thu, 13 Jan 2022 10:00:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F822C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 10:00:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20D9lxFW031889;
 Thu, 13 Jan 2022 10:59:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qpXYHkIcDxax05WYtw6onutWSxVatlONQz5hO4PIxAA=;
 b=I6CkSaWEDQCZo1Zig2pHXg6gtLUx5n+LPhyho7jtY0V2/CtmZaMKpxxdAk1X2hiMrcMy
 +zBKCmaH8pfzkqnMKRUMM/ys+v63DsMKznYzqTZTwlNWjbyzEWsBBWUjOomWbS5JYckK
 kqd8+IscJhBxmUUO1J6hGRCDCtVieUsrD+O6Hu0wGNFVeUmcxbK1YO5UEHxkDXFrgO/H
 6ovWIejspy9UZMf4hxzMxB4tp9RLTWlngzPW4WpuA/LntDSwMYImq505/oxOOTqD7PNF
 7mbT0SjD7V71zcPrGYWU4cG1bAheGVavATuSkEix5JKUWlVoaoGjvua5YuBgUcuKrzV7 GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dj25b3vfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 10:59:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 548DA100034;
 Thu, 13 Jan 2022 10:59:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D0D320C8EA;
 Thu, 13 Jan 2022 10:59:55 +0100 (CET)
Received: from lmecxl1137.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 13 Jan
 2022 10:59:54 +0100
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211215214817.20310-1-yannick.fertre@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <c86e1338-c8d6-f3b7-698c-73d8f04219cb@foss.st.com>
Date: Thu, 13 Jan 2022 10:59:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215214817.20310-1-yannick.fertre@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_02,2022-01-13_01,2021-12-02_01
Subject: Re: [Linux-stm32] [PATCH 3/5] drm/stm: ltdc: add per plane update
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Ck9uIDEyLzE1LzIxIDEwOjQ4IFBNLCBZYW5uaWNrIEZlcnRyZSB3cm90ZToKPiBSZWNlbnQgbHRk
YyBoYXJkd2FyZSB2ZXJzaW9ucyBvZmZlciB0aGUgYWJpbGl0eQo+IHRvIHVwZGF0ZSBhIHBsYW5l
IGluZGVwZW5kZW50bHkgb2Ygb3RoZXJzIHBsYW5lcy4KPiBUaGlzIGlzIGNvdWxkIGJlIHVzZWZ1
bCBlc3BlY2lhbGx5IGlmIGEgcGxhbmUgaXMKPiBhc3NpZ25lZCB0byBhbm90aGVyIE9TLgo+Cj4g
U2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDI2ICsrKysrKysrKysrKysr
KysrKysrKysrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5oIHwgIDEgKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpIZWxsbyBZYW5u
aWNrLAoKUmV2aWV3ZWQtYnk6IFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1w
b3VAZm9zcy5zdC5jb20+CgpUaGFuayB5b3UgZm9yIHRoaXMgcGF0Y2gsClJhcGhhw6tsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
