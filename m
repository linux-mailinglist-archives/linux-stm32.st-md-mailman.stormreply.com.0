Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E711BD7EB
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 11:07:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 738D3C36B0D;
	Wed, 29 Apr 2020 09:07:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A400C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 09:07:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T8wSHn005185; Wed, 29 Apr 2020 11:07:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=e9NwN/IhCOM3jYLOzfdAEssprCoON8TaVJUaQG+tcnY=;
 b=J+GPW50HYzS2dnXExZqnZ0XHPX4HJhPak2/+H/VoXthCvYrz3BF1nP/uko5izwrQMNrv
 wzs46w4f3d+w94AXcFAmi/Sn0y2zTTLH7HbtwL3gYNS285nPHK/AKxJHNb/NVW3lhXhR
 T2kTZS6oyyPzvOu8DFUZQUhnFsEtEcoyvnDoMDHoOsOmxbjE2gV6PXTvpWMdJA+kAxjP
 hBOCr4gJ9hAiFo5EXXhQnWFVTWLITdlztngvL8b9CnozBWDP18OBf3Rre6DMTfrx/zQv
 KsnOasx7zbGbEwn+21S0q6vY6vbOKZEhyJqVQ9HDfeCaZUpNu0HeQwE4apqCgH3oyzwT 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30n4j61dnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 11:07:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3325C10002A;
 Wed, 29 Apr 2020 11:07:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1819920749E;
 Wed, 29 Apr 2020 11:07:09 +0200 (CEST)
Received: from [10.211.9.35] (10.75.127.44) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 11:07:07 +0200
To: Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
 <20200427194747.224a2402@xps13>
 <40a9bac7-9ed4-b781-f2c2-2d90b4e82749@denx.de>
 <20200427200848.722f4c56@xps13>
 <3527f3b8-225d-6e5a-dd8a-0421d475f70b@denx.de>
 <20200427220806.13741ec0@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <75a430de-54af-c4db-9d93-6b3d5e65874c@st.com>
Date: Wed, 29 Apr 2020 11:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200427220806.13741ec0@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_03:2020-04-28,
 2020-04-29 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 04/12] mtd: rawnand: stm32_fmc2: manage
 all errors cases at probe time
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

SGkgTWlxdcOobCwKCk9uIDQvMjcvMjAgMTA6MDggUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Clsu
Li5dCj4+Pj4gYnR3IHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gc3BsaXQgdGhlIGZpcnN0IHRocmVl
IHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMKPj4+PiBpbnRvIGEgc2VwYXJhdGUgc2VyaWVzID8gVGhp
cyByYXduYW5kIHBhcnQgc2VlbXMgbW9yZSBsaWtlIGFuIHVucmVsYXRlZAo+Pj4+IGNsZWFudXAu
Cj4+PiBBcyBpdCBzZWVtcyB0aGF0IHRoZSBNRkQgZGlzY3Vzc2lvbiBjYW4gdGFrZSBsb25nZXIs
IHRoZW4gSSB3b3VsZCBzYXkKPj4+IHllcywgYXQgbGVhc3QgZm9yIHRoZSBjbGVhbnVwL21pc2Mg
Y2hhbmdlcyBwYXJ0Lgo+PiBSaWdodAo+PgoKSSB0aGluayB0aGF0IGl0IGlzIGJldHRlciB0byBv
bmx5IGhhdmUgb25lIHNldCBvZiBwYXRjaGVzIGFzIHRoZXJlIGlzIApkaWZmZXJlbnQgbWFpbnRh
aW5lcnMgdGhhdCB3aWxsIHJldmlldyB0aGUgd2hvbGUgc2V0IG9mIHBhdGNoZXMuCkkgZXhwZWN0
IHRvIGJlIGFibGUgdG8gcHJvcG9zZSBhIHYzIG5leHQgd2VlayB0byBhZGQgdGhlIEVCSSBkcml2
ZXIgYW5kIAp0aGUgdXBkYXRlcyBvbiBOQU5EIGRyaXZlciAoYXMgc29tZSBwYXRjaGVzIGFyZSBs
aW5rZWQpCkEgcHJvcG9zYWwgY291bGQgYmUgdG8gcHV0IGFsbCB0aGUgTkFORCBwYXRjaGVzIHRo
YXQgeW91IGhhdmUgc3RhcnRlZCB0byAKcmV2aWV3IGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIHNl
dCBvZiBwYXRjaGVzIChwYXRjaCA0LzUvNi83LzgpLgpZb3Ugd2lsbCBiZSBmcmVlIHRvIGFwcGx5
IHRoZW0gYWZ0ZXIgdGhlIHJldmlldyBhbmQgSSB3aWxsIG9ubHkgcmVzdWJtaXQgCnRoZSBwYXRj
aGVzIHRoYXQgaGF2ZSBub3QgYmVlbiBhcHBsaWVkIGluIHRoZSBuZXh0IHZlcnNpb24uCgpSZWdh
cmRzLApDaHJpc3RvcGhlIEtlcmVsbG8uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
