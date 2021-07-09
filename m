Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E69D63C2145
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Jul 2021 11:10:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 779ADC5718D;
	Fri,  9 Jul 2021 09:10:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA62BC424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jul 2021 09:10:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169918gk031664; Fri, 9 Jul 2021 11:09:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DVH6ZuxNXZTaEp6S+cHLNHrvmkcMuKnL6vylu2Kte94=;
 b=7X5msmvjOn6lK1uy7Ov8hNhhBoUX+ReOVaZHIli8xgs4URQqfsV9h2q3EJXf0IyZyrk6
 7ruDFLQaiTTrqQkNVRP1+z7Rv3updQNngansGwJLOY/0Yix0aqY6xoBjAXTZsih9S+kd
 poVuB4Kx/1KZe0q+NYpzxtuSki2I6bjBhUKmA8xen5CKzs0uCxzrEN5X83BpPYUhxmC3
 +IzXYipnYgtWR+uKtzKR6JP1KdrOrsfZ3uUxa0CnDt320w51GFLgppGJ8WLDLqv86vTj
 HJaalJUplp1g4iT0HZswmfKbe78By3wzgNH0Gryn8cbYrDtO03w7qs/UDlKBYJvXTfkF 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39p4vbbww3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 11:09:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A91B010002A;
 Fri,  9 Jul 2021 11:09:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 87CAF218CB8;
 Fri,  9 Jul 2021 11:09:48 +0200 (CEST)
Received: from lmecxl0557.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 11:09:47 +0200
To: Simon Ser <contact@emersion.fr>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>, Philippe CORNU - foss
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>, Matt Roper
 <matthew.d.roper@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Yannick FERTRE
 <yannick.fertre@st.com>, Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <31K3xupK1-7HNWorHqIwGwgEJl-1XdFjUQEoNYm6yB-lRoZ8kq5quRji_r3mzPZ0bUayLef6xPfQDiETgZp9lR7vUpDn2nB_37ncSd-J0Wc=@emersion.fr>
 <YOWTCSpOZTGZS2qP@phenom.ffwll.local>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <a8f02b4c-b1ea-320e-a6b2-952f4e641794@foss.st.com>
Date: Fri, 9 Jul 2021 11:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOWTCSpOZTGZS2qP@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_04:2021-07-09,
 2021-07-09 signatures=0
Subject: Re: [Linux-stm32] [PATCH 0/2] Add "BACKGROUND_COLOR" drm property
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

Ck9uIDcvNy8yMSAxOjQyIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFdlZCwgSnVsIDA3
LCAyMDIxIGF0IDA5OjAzOjAzQU0gKzAwMDAsIFNpbW9uIFNlciB3cm90ZToKPj4gSGksCj4+Cj4+
IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLiBEbyB5b3UgaGF2ZSBwbGFucyBmb3IgdXNlci1z
cGFjZQo+PiBpbXBsZW1lbnRhdGlvbnMgYW5kIElHVD8KPiBOb3RlIHRoYXQgdGhlc2UgcGFydHMg
YXJlIG1hbmRhdG9yeSwgYW5kIHRoZXJlJ3MgYSBwYXRjaCBmbG9hdGluZyBhcm91bmQKPiBmdXJ0
aGVyIGNsYXJpZnlpbmcgd2hhdCdzIGFsbCBleHBlY3RlZCBmb3IgbmV3IHByb3BlcnRpZXM6Cj4K
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMTA3MDYxNjEyNDQuMTAzODU5
Mi0xLW1heGltZUBjZXJuby50ZWNoLwoKCkhpLAoKCldlIGRvbid0IHVzdWFsbHkgdGVzdCB3aXRo
IHBpZ2xpdCBhbmQgaWd0LWdwdS10b29scy4gSW5zdGVhZCwgbW9kZXRlc3QgCnV0aWxpdHkgb2Yg
dGhlIGxpYmRybSBpcyB1c2VkIHF1aXRlIG9mdGVuIChhcyBpcyBpdCB0aGUgY2FzZSBpbiBvcmRl
ciB0byAKdGVzdCB0aGlzIHByb3BlcnR5KS4KCgpXZSBwbGFuIHRvIHBvcnQgdGhvc2UgdG9vbHMg
b24gb3VyIHBsYXRmb3JtIGJlZm9yZSBpbXBsZW1lbnRpbmcgdGhpcyAKa2luZCBvZiB0ZXN0cywg
YnV0IGl0IHdpbGwgcmVxdWlyZSBhIGJpdCBtb3JlIHRpbWUuCgpBbiBhbmFseXNpcyBpcyBjdXJy
ZW50bHkgb25nb2luZy4KCgpGdXJ0aGVybW9yZSwgZG8geW91IGhhdmUgYW55IGFkdmljZSBvbiB0
b3Agb2YgZG9jdW1lbnRhdGlvbiBmb3IgCmltcGxlbWVudGluZyBzdWNoIHRlc3RzID8KCgpJIHdh
cyBhbHNvIHRoaW5raW5nIGFib3V0IGltcGxlbWVudGluZyBhbiBvcHRpb24gaW50byBtb2RldGVz
dCB0byBlYXNlIAp0aGUgdXNlIG9mIHRoaXMgZHJtIHByb3BlcnR5IChzdXBwb3J0IG9mIGhleGFk
ZWNpbWFsIHZhbHVlcyBmb3IgcHJvcGVydGllcykuCgoKUmVnYXJkcywKClJhcGhhw6tsCgo+Cj4g
Q2hlZXJzLCBEYW5pZWwKPgo+PiBUaGFua3MsCj4+Cj4+IFNpbW9uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
