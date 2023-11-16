Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CD7EE3DC
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Nov 2023 16:05:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68431C6C837;
	Thu, 16 Nov 2023 15:05:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75FE0C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:05:25 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AGEbDG3015626; Thu, 16 Nov 2023 16:05:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=foZ+0zsZkQOMr0h9cc6snUTMOiYLnKSLyxuVrbJeOlY=; b=RD
 M4EIh0ZX45jr20tRYkGMMjBqcLyyBK41WSOUDI3Jgf5MB6f7rRt2hhMLqueTCGXg
 DG3Ko487dQKAAa1brKW07f/sBMbnUNM2MrW/YPwyOkb2NX8HyTV6IdyytP9Ddd0O
 3v7ng8vVWBeqDL3NMMJGHUhEE/w5HoQuXALNVztGT/1X+6LDf33keSohTGExPSQU
 25fsdk7Y0Q7Boo7BV2evUq8dF9BLNMnIuOEdxZslaOkauaom27k4otDRC52gmu09
 6NuUYts9qmPGmYQX6tvK9YUyNnPdbHR3mxuvFeMvABTxYBHzCNYeV8XJs4wdYxcH
 W8q9yaWVB/h9vMEfYWkQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3udn0m03s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 16:05:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 68937100056;
 Thu, 16 Nov 2023 16:05:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E233235F02;
 Thu, 16 Nov 2023 16:05:06 +0100 (CET)
Received: from [10.201.20.59] (10.201.20.59) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 16 Nov
 2023 16:05:05 +0100
Message-ID: <363a8b67-1b6d-49e3-a2e0-3a0c97759ada@foss.st.com>
Date: Thu, 16 Nov 2023 16:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
 <20231019200658.1754190-12-u.kleine-koenig@pengutronix.de>
 <c2da3f60-595c-4938-809a-c5640388c13c@foss.st.com>
 <20231114212009.44r742f3xqosswod@pengutronix.de>
 <e7034e83-7c1a-4706-8382-536b260284eb@foss.st.com>
 <20231115210155.p6m5rbahpzusy6bc@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20231115210155.p6m5rbahpzusy6bc@pengutronix.de>
X-Originating-IP: [10.201.20.59]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_15,2023-11-16_01,2023-05-22_02
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/5] pwm: stm32: Fix enable count for clk
	in .probe()
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

T24gMTEvMTUvMjMgMjI6MDEsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEhlbGxvIEZhYnJp
Y2UsCj4gCj4gT24gV2VkLCBOb3YgMTUsIDIwMjMgYXQgMTA6MDI6MjBBTSArMDEwMCwgRmFicmlj
ZSBHYXNuaWVyIHdyb3RlOgo+PiAod2l0aCBvciB3aXRob3V0IGEgRml4ZXMgdGFnKSBDb3VsZCB5
b3UgYWRkIGEgY2hlY2sgb24gZ2xvYmFsIGNvdW50ZXIKPj4gZW5hYmxlIGJpdCAoVElNX0NSMV9D
RU4pIGJvdGggaW4gdGhlIC5nZXRfc3RhdGUoKSwgYW5kIGluIHRoZQo+PiBzdG0zMl9wd21fZGV0
ZWN0X2NoYW5uZWxzKCksIHRoYXQgY291bnRzIHRoZSBudW1fZW5hYmxlZCBjaGFubmVscyA/Cj4g
Cj4gSSdkIGFkZHJlc3MgdGhhdCBzZXBhcmF0ZWx5LCBtb3N0bHkgYmVjYXVzZSB0aGUgcGF0Y2hl
cyBmb3J3YXJkZWQgaGVyZQo+IGFyZSBub3QgbWluZS4KCk9rLCBsZXQncyBnbyB0aGlzIHdheS4K
Cj4gCj4+IEluIGNhc2UgdGhlIFRJTV9DUjFfQ0VOIGlzbid0IHNldCAoYnV0IHNvbWUgb2YgdGhl
IFRJTV9DQ0VSX0NDWEUgYXJlKSwKPj4gdGhlIGRyaXZlciB3aWxsIHJlcG9ydCBlbmFibGVkIGNo
YW5uZWxzLiBCdXQgcGh5c2ljYWxseSwgdGhlIHB3bSBvdXRwdXQKPj4gd2lsbCBiZSBpbmFjdGl2
ZS4KPiAKPiBIdXV1LCB0aGF0IG1lYW5zIGlmIGNoYW5uZWwgIzAgaXMgcnVubmluZyBhbmQgSSBz
dGFydCBhIGNhcHR1cmUgb24KPiBjaGFubmVsICMxIHdoaWNoIHJlc3VsdHMgaW4gdW5jb25kaXRp
b25hbGx5IGNhbGxpbmcKPiByZWdtYXBfY2xlYXJfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEs
IFRJTV9DUjFfQ0VOKTsgKGluCj4gc3RtMzJfcHdtX3Jhd19jYXB0dXJlKCkpIGNoYW5uZWwgIzAg
c3RvcHMgdG8gdG9nZ2xlIQoKQmFzaWNhbGx5IG5vLCBwbGVhc2UgZmluZCBteSBhbnN3ZXJzIHNl
bnQgc2VwYXJhdGVseSBvbiAiW1BBVENIXSBwd206CnN0bTMyOiBNYXJrIGNhcHR1cmUgc3VwcG9y
dCBhcyBicm9rZW4iCgo+IAo+PiBUaGF0J3MgbW9yZSBhIHJvYnVzdG5lc3MgY2FzZS4uLiBkZXBl
bmRpbmcgb24gd2hhdCdzIGJlZW4gZG9uZSBwb3NzaWJseQo+PiBieSBib290bG9hZGVyLiBXaGF0
IHRvIHlvdSB0aGluayA/Cj4gCj4gSSB3b3VsZCBhc3N1bWUgdGhhdCBhIGJvb3Rsb2FkZXIgdGhh
dCBzZXRzIHRoZSBDQ1hFIGJpdHMgYWxzbyBlbmFibGVzCj4gVElNX0NSMV9DRU4gYW5kIHNvIGlu
IHByYWN0aXNlIFBoaWxpcHAncyBwYXRjaCBpcyBmaW5lLiBCdXQgSSBhZ3JlZSB0aGF0Cj4gZG9p
bmcgdGhpbmdzIHByb3Blcmx5IHdvdWxkIGJlIGJldHRlci4KCm9rLCB0aGFua3MsCkJlc3QgUmVn
YXJkcywKRmFicmljZQo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
