Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F383C5FC5
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jul 2021 17:50:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B96DC57B6F;
	Mon, 12 Jul 2021 15:50:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB92DC57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jul 2021 15:50:47 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CFcD4J013923; Mon, 12 Jul 2021 17:50:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7wHZiJKHopPjFcSmO2LJg+VmslPpnToK6px9Xl/jPQI=;
 b=A83AvVfhzLWkRvB7KrIISwsXt7QaI27BUJyilJ5P8lkljEFrQdIa/XcwOgQpYZ7voFg7
 067f1Dz22H1309kWFEBXN61a1UVvWXFQF2/WE3pdfgQIxPu5nSUaWVPYLH+DiIAmQ7KP
 GPdzXJAq/4ZDPhTZOmxjnDlOtH7ug6j0c54DYP9BmKtHaE3b8cAiQd9cHrVpU+BUwBDy
 WCQ58T7/IbxEZCDU8CF1y71Qyuxw7uwz5RnzOYG2XYLQPmxv4pCn54LUatdDEhzNnF//
 eIg0XWo4gS6KZXc4m1MzLDEgXmL/xxhkPyUVQ7XRbWXQWRk+qnq2vSjbyY3LO0LDU0QD Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39rk1vhqdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 17:50:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C939910002A;
 Mon, 12 Jul 2021 17:50:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9525E231DFC;
 Mon, 12 Jul 2021 17:50:17 +0200 (CEST)
Received: from lmecxl0557.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul
 2021 17:50:16 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Simon Ser <contact@emersion.fr>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <31K3xupK1-7HNWorHqIwGwgEJl-1XdFjUQEoNYm6yB-lRoZ8kq5quRji_r3mzPZ0bUayLef6xPfQDiETgZp9lR7vUpDn2nB_37ncSd-J0Wc=@emersion.fr>
 <YOWTCSpOZTGZS2qP@phenom.ffwll.local>
 <a8f02b4c-b1ea-320e-a6b2-952f4e641794@foss.st.com>
 <OMOzHvru0iqQzq7rTSqJtI0P9wKSBLATuflwj10xgHvSgJ49V522CaDkIiZ0wWHJw-F5GPQxeO8cKO5ACMXggtDNlfx5TAa0zRObj7wsHHg=@emersion.fr>
Message-ID: <208def96-ac15-ce4e-7a0a-b555ea314fc5@foss.st.com>
Date: Mon, 12 Jul 2021 17:50:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <OMOzHvru0iqQzq7rTSqJtI0P9wKSBLATuflwj10xgHvSgJ49V522CaDkIiZ0wWHJw-F5GPQxeO8cKO5ACMXggtDNlfx5TAa0zRObj7wsHHg=@emersion.fr>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_09:2021-07-12,
 2021-07-12 signatures=0
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philippe CORNU <philippe.cornu@st.com>, Matt Roper <matthew.d.roper@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Ck9uIDcvOS8yMSAxMToyMyBBTSwgU2ltb24gU2VyIHdyb3RlOgo+IE9uIEZyaWRheSwgSnVseSA5
dGgsIDIwMjEgYXQgMTE6MDksIFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1w
b3VAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4+IFdlIGRvbid0IHVzdWFsbHkgdGVzdCB3aXRoIHBp
Z2xpdCBhbmQgaWd0LWdwdS10b29scy4gSW5zdGVhZCwgbW9kZXRlc3QKPj4gdXRpbGl0eSBvZiB0
aGUgbGliZHJtIGlzIHVzZWQgcXVpdGUgb2Z0ZW4gKGFzIGlzIGl0IHRoZSBjYXNlIGluIG9yZGVy
IHRvCj4+IHRlc3QgdGhpcyBwcm9wZXJ0eSkuCj4gSnVzdCB0byBtYWtlIGl0IGV4dHJhIGNsZWFy
OiByZWdhcmRsZXNzIG9mIGhvdyB5b3UgYnJpbmcgdXAgeW91ciBkcml2ZXIKPiBpbXBsZW1lbnRh
dGlvbiwgd2l0aG91dCBhbiBJR1QgdGVzdCBhbmQgcmVhbC13b3JsZCBvcGVuLXNvdXJjZSB1c2Vy
LXNwYWNlCj4gcGF0Y2hlcyB0aGF0IG1ha2UgdXNlIG9mIHRoZSBuZXcgcHJvcCwgeW91ciBwYXRj
aGVzICpjYW5ub3QqIGJlIG1lcmdlZC4KPgo+IElmIHlvdSdyZSBwbGFubmluZyB0byBhZGQgc3Vw
cG9ydCBmb3IgdGhlIG5ldyBwcm9wIHRvIGFuIG9wZW4tc291cmNlIEtNUwo+IGNsaWVudCwgcGxl
YXNlIGFkZCBhIGxpbmsgdG8gdGhlIHBhdGNoZXMgaW4geW91ciBrZXJuZWwgc3VibWlzc2lvbi4g
SWYKPiB5b3UgZG9uJ3QgaGF2ZSBwbGFucyB0byB1c2UgdGhlIG5ldyBwcm9wIGluIGFuIG9wZW4t
c291cmNlIEtNUyBjbGllbnQsCj4gbGV0IHVzIGtub3cgYW5kIHdlIGNhbiBkaXNjdXNzIHdoYXQg
dGhlIGJlc3QgY2FuZGlkYXRlIHdvdWxkIGJlLgoKSGksCgpUaGFua3MgZm9yIHlvdXIgZmVlZGJh
Y2sgOikKCgpXZSBkbyBub3QgaGF2ZSBhbnkgS01TIGNsaWVudCBjdXJyZW50bHkgdXNpbmcgdGhp
cyBwcm9wZXJ0eSBhcGFydCBmcm9tIHByb3ByaWV0YXJ5IHNvbHV0aW9ucyBtYWRlIGJ5IGNvbnN1
bWVycy4KClRoaXMgcHJvcGVydHkgd2FzIG9yaWdpbmFsbHkgbWFkZSB0byBkaXNwbGF5IGEgbG9n
byBwaWN0dXJlIHdoZW4gdGhlIHNjcmVlbiBpcyBpbiBpZGxlIChsb3cgcG93ZXIvbG93IEREUiB1
c2FnZSkuCgoKUmVnYXJkcywKClJhcGhhw6tsCgoKPj4gSSB3YXMgYWxzbyB0aGlua2luZyBhYm91
dCBpbXBsZW1lbnRpbmcgYW4gb3B0aW9uIGludG8gbW9kZXRlc3QgdG8gZWFzZQo+PiB0aGUgdXNl
IG9mIHRoaXMgZHJtIHByb3BlcnR5IChzdXBwb3J0IG9mIGhleGFkZWNpbWFsIHZhbHVlcyBmb3Ig
cHJvcGVydGllcykuCj4gKEZvciB0aGUgcmVjb3JkLCBtb2Rlc2V0IGRvZXNuJ3QgY291bnQgYXMg
YSByZWFsLXdvcmxkIHVzZXItc3BhY2UgdXNhZ2U6IGl0J3MKPiBqdXN0IGEgdG95IGltcGxlbWVu
dGF0aW9uLCBqdXN0IGEgdGVzdCB0b29sLikKPgo+IFNpbW9uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
