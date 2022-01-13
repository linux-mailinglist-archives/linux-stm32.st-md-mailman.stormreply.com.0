Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E948D8A9
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jan 2022 14:17:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20544C5F1F7;
	Thu, 13 Jan 2022 13:17:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5507C5C82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 13:17:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20D8S0ZJ016882;
 Thu, 13 Jan 2022 14:17:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=vWWHFsuh46D5SfaO0k2X8hLjowrmWXVkxsmKvyUtw8U=;
 b=hX0hu6/JJ425axfDUuOLyU5Q2bDitArl2sA2zP3byEiWLNAuAGFdRudKDa3iSapIWLYb
 b4OREpi6MyUZDlONmJYlwHbMZ6ICffVepyGiaZaH4owWq+7BeFv3aMC1FDPvKwOm7/NE
 kFkV/J7IiaQvH6o17y47gYgbgnqZeba8Vns41Eu6Oyx/UuvPWlCKONNJlpxJlZQT6+QE
 nPZSEFipCOM3dvOx9r+1ywGjLkcyIoX7qqjhad0UqkYkuqn/aLyN5k352eREvP7CVNZ5
 L72ek77bk+iQEUZpWpJx46+JC++VIioplW0hLTxjV7uUbMLhq78Byk7oASPRvrtmEY/L kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djgkksh8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 14:17:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9CBCA10002A;
 Thu, 13 Jan 2022 14:17:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A87220D186;
 Thu, 13 Jan 2022 14:17:05 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 13 Jan
 2022 14:17:03 +0100
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, Simon Ser
 <contact@emersion.fr>
References: <20211226112503.31771-1-jose.exposito89@gmail.com>
 <20211226112503.31771-3-jose.exposito89@gmail.com>
 <3DdB6YPUQr4O063yNreefZcIm6p5Z6HORoVVbk5RTMmjz8qvnxMse42hLvfDmA323KG-TWLc_JUFZEEEIkoINXQuAzjLVe2jRRM01tQgYOU=@emersion.fr>
 <20220107172601.GA122757@elementary>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <735432ff-d9a7-aff0-e94a-13035e944570@foss.st.com>
Date: Thu, 13 Jan 2022 14:16:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107172601.GA122757@elementary>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_04,2022-01-13_01,2021-12-02_01
Cc: airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 alexandre.torgue@foss.st.com, stefan@agner.ch, benjamin.gaignard@linaro.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 ville.syrjala@linux.intel.com, marex@denx.de, linux-imx@nxp.com,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, dmitry.baryshkov@linaro.org, shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/6] drm/plane: Fix typo in
 format_mod_supported documentation
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

CgpPbiAxLzcvMjIgNjoyNiBQTSwgSm9zw6kgRXhww7NzaXRvIHdyb3RlOgo+IEhpIFNpbW9uLAo+
IAo+IE9uIFdlZCwgSmFuIDA1LCAyMDIyIGF0IDExOjU0OjQzUE0gKzAwMDAsIFNpbW9uIFNlciB3
cm90ZToKPj4gUHVzaGVkIHBhdGNoZXMgMSAmIDIgdG8gZHJtLW1pc2MtbmV4dC4gVGhhbmtzIGZv
ciB5b3VyIGNvbnRyaWJ1dGlvbiEKPiAKPiBUaGFua3MgYSBsb3QgZm9yIHRoZSByZXZpZXcgYW5k
IGZvciBhcHBseWluZyB0aGUgY2hhbmdlcywgYXBwcmVjaWF0ZSBpdC4KPiAKPiBJcyB0aGVyZSBz
b21ldGhpbmcgdGhhdCBuZWVkcyB0byBpbXByb3ZlIGluIHRoZSBvdGhlciA0IHBhdGNoZXM/Cj4g
T3IganVzdCB3YWl0aW5nIG9uIG1haW50YWluZXJzIGlucHV0Pwo+IAo+IFRoYW5rcywKPiBKb3PD
qSBFeHDDs3NpdG8KPiAKCkhpIEpvc8OpLApmb3IgdGhlIGRybS9zdG0gcGFydCwKQXBwbGllZCBv
biBkcm0tbWlzYy1uZXh0LgpNYW55IHRoYW5rcyBmb3IgeW91ciBwYXRjaGVzLApQaGlsaXBwZSA6
LSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
