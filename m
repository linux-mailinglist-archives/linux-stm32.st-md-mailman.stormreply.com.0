Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v3DcJLFjT2opfwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 11:02:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD1872EA0B
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 11:02:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=e8drr8S6;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=X6JRSTnI;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85CFBC9AE31;
	Thu,  9 Jul 2026 09:02:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CF60C56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 06:25:58 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66960G99887925
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 9 Jul 2026 06:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XkS0qjbBMR4bx7I0LwF03G25ZO0lBo870NfALSlDjq4=; b=e8drr8S6L/NQmGEG
 +01bhR+Y+IVDfJc99E+U3BaaxSi87bNGogUvMwHI6OjC/MlcteROsVg0tpt15Uic
 iK7VAiITAy4z0uDp3HZWFOV2k5QK6nBh7kDZzgPdwnpYFX3XI7qsHgUjQMLQHz/b
 ArxVvks6Si/rwNIEsKdmhTEBMMftGG58nWCOrOC7m5YtsD8UPMf4wa6h/zpOn6Kd
 XbmkXSpQPgXLJi6Ze7mkyXtmKBrEK6GaSw+IjuFVvDI6wB+AbUcmvtRZ3VfEDc9A
 VWwcv7sjdTl0XE/dAh+qpiKbWJNYGFKX7u0XdpCpAfmQJM92BbfBXbaGUpe46D53
 TDOQVw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq332b3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2026 06:25:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c85798977dcso2412744a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jul 2026 23:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783578357; x=1784183157;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XkS0qjbBMR4bx7I0LwF03G25ZO0lBo870NfALSlDjq4=;
 b=X6JRSTnIyoZYvTzorGnYLd4A1z236vEgrCkd1liz2y3+I0XfqM2MJUOKhDde5Uc4FI
 FRXZHOW0Cu+LqcIhwn35rp8oyLE3MpjaogH7P1RYWrKO5nkO0+7ooY7dVPO95xu0D4Xy
 c73P3FsRJLXCdHYOcyUZPRNa2pw4NebGbsOEiwkpMW1d37f7MFBjYDy3zXMSut13go96
 pr2oRdLz/cz3iOyol01UG0zVTxWYM7PSJFYQbzr5TPKKZk/ddl/KF7RfBX+UzYP6WIeQ
 d7pYhkksR/XnrFnNgmjtTn0ufKEl42OrZe2KI28+DXJQVJjOff1WJAM6srg00KqSlH7U
 KGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783578357; x=1784183157;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XkS0qjbBMR4bx7I0LwF03G25ZO0lBo870NfALSlDjq4=;
 b=fAXYRLyVIUjQUXfy4FOYkXSLC4TiCxYvyGezOymgJAjVzIm+IuV/dr+5IsqE71utCe
 dXehAhQkNLOj68tZGSBRp9xBIDkGcKBg+r7yDxI2xC4ITPSE1gPh95evOOfRAJAKIlXz
 G6A4AJN2ueMxMbFuP+f8lLMe+VGm6qLfH9kgETSvSUCmOM1RIZpP8jS6hfU1C5o5hcmx
 NqYDVsUVx6PwycStscWmj3ZZpPg9rcBFon+VJMcuEmM1pd7x2WE/rU7f6tzBQpwPm11i
 zxX4cO9GJRItadvHJ7KJ1EV2Mk0KLukBy+Wrv0kdnrINM4RVV6BE8DPuJZKD3VYf8DrG
 DOJw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqoZTloHdwRMMsCl39BAXHrgUbHgnLgxyR7OUZFaS1RgqQQKEmfcns7MslUzoStMcau68YM4XoqMxuHhA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzUJEJu+Rj/zGva3+HqaQCXdPcvl0FMQjG53pkAq0njzQVD9kwf
 JreRM0p1UY8nAIGC28iutvl6ty2ROU1JqpQEGHL3PsSle9EX4slAv/+1oLPoPKIzoSwHXEcWRMn
 GfBQmA0SFwAb55vQkAoX665xy0AzYsAMy8keig/GoTaV6w5gtDF5isyIb1O37Cdn4WHiFdReDn1
 8VJwAoQb0=
X-Gm-Gg: AfdE7cnv61bGoWrVmqe3mqtDcg0MZtzkl9KZ7aq9AJOnWHwYjJ1sPvKTgE3sEAg+fOq
 KqUJOYz4kfZ5F7IBA5/ZlmP1c0hSr/e2RT1N+rIbWUJ5qBx9N3JvnCHnToD1l84kywx6rOIFm3i
 tosVX9rAhJS5oxjC0ppBq00o2IQuLuk1HACAeW7BdLLbpnA1l7mx4W8191/4bIG4YeSHQ2NEMge
 c1pf5VJjDLfCaK6FlZpv4XcxceKDzdg4I+CL87mo0rsmuoct3/FrYIkK2Hl7BUiCnHWHZQ0hEie
 M4fWbZGXs4qBi2PB2dnzqrfwp6Ag9DfJ4zOZl11geipB8ngo4/pNhVqpunegIFt1IPhj8wcgpf/
 XippHi7l/CeUKjLcv+p9KE0ba+HBx2H4FuIQQcuaHp6/z
X-Received: by 2002:a17:902:daca:b0:2ca:c4a5:84bb with SMTP id
 d9443c01a7336-2ccea3a737fmr61764075ad.38.1783578356714; 
 Wed, 08 Jul 2026 23:25:56 -0700 (PDT)
X-Received: by 2002:a17:902:daca:b0:2ca:c4a5:84bb with SMTP id
 d9443c01a7336-2ccea3a737fmr61763605ad.38.1783578356098; 
 Wed, 08 Jul 2026 23:25:56 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 23:25:55 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:14 +0530
MIME-Version: 1.0
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-2-e85c6ffa8ec4@oss.qualcomm.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
In-Reply-To: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Peter Korsgaard <jacmet@sunsite.dk>, Michal Simek <michal.simek@amd.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 bjorn.andersson@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=7834;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=b2izFxn+4IiiyKp9j0s8vQoNlL/tiuR3/hHtBJpHypk=;
 b=DiGW1ZUts1Plz+MKuKKnKr4MwFWfW5eunK8R4MyGl0ZMAS/6fAayulfFs5o4Ae/dAXTYeNVbK
 +fgruC+Vge8B91yUCFVVeTpTzyXxnoAKhIaokLIyV6nwlSzhKWExJ8e
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: u2jmRJ1TEXXMrUm_4svi6FrPtAkU_ibl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXzLFjw1jcsNQ0
 06GtS7572Z+xhTNIewCntG1FkOpVpH4gWq5eDX7xG+79NRdSKW5xEGCSngaQdVMB4rxVmJkFI3+
 LE0MUF3rJLgxJTMiI2of+O4rw2M64Q3OHJe3BZi8qDNV2XZ/A18uDMNcuC/Z00wuzvh4yd+BPTt
 tjr8LrziIu+q9IQodyNPESavGvH9APWnkiDJpHCln/pLRC0z9Hd3XZTfF0f5I1c4m1Iqh3oPLbj
 0w0W8EL1Q3q8cNJdrYES+2Xqao/Q+PSjUlONOF3Q6HmatcKLyGeFVsDcOz7w0mR+Mza+2wuQCYh
 cje1gLWhIMPkdHAhCjphNXhpV9R7OjBljZ+Yxf5etWm6dHB4VykhSKJPQ5byQzjjZZKNCCcNieS
 8aRqS3f+Rc7DDOryInmwGUx7dIS/bKfAs2EW9ESsaU+mLlIIRLEjhzzj2PsPbwzJqGJIZjmeRLX
 DmPdhvYjQeOOBBr9ifA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXyP3xC7pdaV/j
 UOT8NCNx8DYoM7aLTsgs1d5+MEnD+5T0XH1PdVmmM8OrEsLcrTqBdKPCBUdK2OErC8U7fXbj86D
 MkyARMwt4rcBOfNiny3F39/rdrRJaRU=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f3ef5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MdvWXRze9gsMBWCGvMoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: u2jmRJ1TEXXMrUm_4svi6FrPtAkU_ibl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090058
X-Mailman-Approved-At: Thu, 09 Jul 2026 09:02:39 +0000
Cc: linux-samsung-soc@vger.kernel.org, aniket.randive@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 chandana.chiluveru@oss.qualcomm.com, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, Praveen Talari <praveen.talari@oss.qualcomm.com>,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/6] serial: 8250: update .pm callbacks to
	return int
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:tony@atomide.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-samsung-soc@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:chand
 ana.chiluveru@oss.qualcomm.com,m:linux-mediatek@lists.infradead.org,m:linux-serial@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-omap@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,atomide.com,armlinux.org.uk,alpha.franken.de,oss.qualcomm.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uart_ops.pm:url,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,uart_port.pm:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAD1872EA0B

The uart_ops.pm and uart_port.pm callback signatures have been changed
from void to int. Update all 8250 .pm implementations to match.

serial8250_do_pm() is the core 8250 power management helper, exported
for use by sub-drivers. Change its return type from void to int and
update its declaration in include/linux/serial_8250.h accordingly.
serial8250_do_pm() always returns 0.

serial8250_pm() is the uart_ops.pm entry point for the 8250 driver. It
delegates to a per-port pm function stored in uart_port.pm or falls back
to serial8250_do_pm(). Both paths are called for their side effects and
the function returns 0.

The remaining sub-driver callbacks perform their PM work through
platform-specific helpers (clocks, runtime PM, GPIO) and currently have
no error paths of their own. Update them to return 0 to satisfy the new
signature; individual error propagation can be added per-driver as
needed.

  8250_exar: exar_pm()
  8250_mtk:  mtk8250_do_pm()
  8250_omap: omap_8250_pm()
  8250_pxa:  serial_pxa_pm()

No functional change intended.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/8250/8250_dw.c   | 3 ++-
 drivers/tty/serial/8250/8250_exar.c | 4 +++-
 drivers/tty/serial/8250/8250_mtk.c  | 4 +++-
 drivers/tty/serial/8250/8250_omap.c | 6 ++++--
 drivers/tty/serial/8250/8250_port.c | 9 ++++++---
 drivers/tty/serial/8250/8250_pxa.c  | 6 ++++--
 include/linux/serial_8250.h         | 6 +++---
 7 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 5fba913f3301..7d5fa11d685f 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -458,7 +458,7 @@ static int dw8250_handle_irq(struct uart_port *p)
 	return 1;
 }
 
-static void
+static int
 dw8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 {
 	if (!state)
@@ -468,6 +468,7 @@ dw8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 
 	if (state)
 		pm_runtime_put_sync_suspend(port->dev);
+	return 0;
 }
 
 static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
index c682c0d0dffa..0d0026ea155f 100644
--- a/drivers/tty/serial/8250/8250_exar.c
+++ b/drivers/tty/serial/8250/8250_exar.c
@@ -419,7 +419,7 @@ static const struct serial_rs485 generic_rs485_supported = {
 	.flags = SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND,
 };
 
-static void exar_pm(struct uart_port *port, unsigned int state, unsigned int old)
+static int exar_pm(struct uart_port *port, unsigned int state, unsigned int old)
 {
 	/*
 	 * Exar UARTs have a SLEEP register that enables or disables each UART
@@ -428,6 +428,8 @@ static void exar_pm(struct uart_port *port, unsigned int state, unsigned int old
 	 * the UART channel may only write to the corresponding bit.
 	 */
 	serial_port_out(port, UART_EXAR_SLEEP, state ? 0xff : 0);
+
+	return 0;
 }
 
 /*
diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index e6a56cf54ae0..9184b1eeddd7 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -452,7 +452,7 @@ static int __maybe_unused mtk8250_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static void
+static int
 mtk8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 {
 	if (!state)
@@ -462,6 +462,8 @@ mtk8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 
 	if (state)
 		pm_runtime_put_sync_suspend(port->dev);
+
+	return 0;
 }
 
 #ifdef CONFIG_SERIAL_8250_DMA
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index c552c6b9a037..8f099afd6ff8 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -527,8 +527,8 @@ static void omap_8250_set_termios(struct uart_port *port,
 }
 
 /* same as 8250 except that we may have extra flow bits set in EFR */
-static void omap_8250_pm(struct uart_port *port, unsigned int state,
-			 unsigned int oldstate)
+static int omap_8250_pm(struct uart_port *port, unsigned int state,
+			unsigned int oldstate)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 	u8 efr;
@@ -546,6 +546,8 @@ static void omap_8250_pm(struct uart_port *port, unsigned int state,
 	serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
 	serial_out(up, UART_EFR, efr);
 	serial_out(up, UART_LCR, 0);
+
+	return 0;
 }
 
 static void omap_serial_fill_features_erratas(struct uart_8250_port *up,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 630deb7dd344..315e0a2fcc14 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2848,16 +2848,18 @@ serial8250_set_ldisc(struct uart_port *port, struct ktermios *termios)
 		serial8250_do_set_ldisc(port, termios);
 }
 
-void serial8250_do_pm(struct uart_port *port, unsigned int state,
-		      unsigned int oldstate)
+int serial8250_do_pm(struct uart_port *port, unsigned int state,
+		     unsigned int oldstate)
 {
 	struct uart_8250_port *p = up_to_u8250p(port);
 
 	serial8250_set_sleep(p, state != 0);
+
+	return 0;
 }
 EXPORT_SYMBOL(serial8250_do_pm);
 
-static void
+static int
 serial8250_pm(struct uart_port *port, unsigned int state,
 	      unsigned int oldstate)
 {
@@ -2865,6 +2867,7 @@ serial8250_pm(struct uart_port *port, unsigned int state,
 		port->pm(port, state, oldstate);
 	else
 		serial8250_do_pm(port, state, oldstate);
+	return 0;
 }
 
 static unsigned int serial8250_port_size(struct uart_8250_port *pt)
diff --git a/drivers/tty/serial/8250/8250_pxa.c b/drivers/tty/serial/8250/8250_pxa.c
index 6dd0190b4843..02f0037e0a31 100644
--- a/drivers/tty/serial/8250/8250_pxa.c
+++ b/drivers/tty/serial/8250/8250_pxa.c
@@ -76,8 +76,8 @@ static void serial_pxa_dl_write(struct uart_8250_port *up, u32 value)
 }
 
 
-static void serial_pxa_pm(struct uart_port *port, unsigned int state,
-	      unsigned int oldstate)
+static int serial_pxa_pm(struct uart_port *port, unsigned int state,
+			 unsigned int oldstate)
 {
 	struct pxa8250_data *data = port->private_data;
 
@@ -85,6 +85,8 @@ static void serial_pxa_pm(struct uart_port *port, unsigned int state,
 		clk_prepare_enable(data->clk);
 	else
 		clk_disable_unprepare(data->clk);
+
+	return 0;
 }
 
 static int serial_pxa_probe(struct platform_device *pdev)
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index a95b2d143d24..12916189c20c 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -57,7 +57,7 @@ struct plat_serial8250_port {
 				     struct ktermios *);
 	unsigned int	(*get_mctrl)(struct uart_port *);
 	int		(*handle_irq)(struct uart_port *);
-	void		(*pm)(struct uart_port *, unsigned int state,
+	int		(*pm)(struct uart_port *port, unsigned int state,
 			      unsigned old);
 	void		(*handle_break)(struct uart_port *);
 };
@@ -189,8 +189,8 @@ void serial8250_do_set_ldisc(struct uart_port *port, struct ktermios *termios);
 unsigned int serial8250_do_get_mctrl(struct uart_port *port);
 int serial8250_do_startup(struct uart_port *port);
 void serial8250_do_shutdown(struct uart_port *port);
-void serial8250_do_pm(struct uart_port *port, unsigned int state,
-		      unsigned int oldstate);
+int serial8250_do_pm(struct uart_port *port, unsigned int state,
+		     unsigned int oldstate);
 void serial8250_do_set_mctrl(struct uart_port *port, unsigned int mctrl);
 void serial8250_do_set_divisor(struct uart_port *port, unsigned int baud,
 			       unsigned int quot);

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
