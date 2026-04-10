Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GdaGM6O2Gm+fAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 07:46:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D9F3D25D8
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 07:46:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76478C87EC6;
	Fri, 10 Apr 2026 05:46:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FEBEC87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 05:46:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 639KmFtq2626845
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 10 Apr 2026 05:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=; b=fW7Yvbv3HxYGOLVw
 G2nvFRqIJSayLL1KpAL4BDQiL0UzERgrY8ZutytnpNdpckuepgm7r+NiEMjCJ9PA
 NeO5UPKcX7WlqcaghjeEnGBuscga0ehBLsGvuAkAmMtg6P/dVlkrsB6BkPepEOG8
 M2rOR5lhdtNNr7CRMBufIMdQggx+sY9e34TAqGQZeDGuK7Ld1UiHMV0BPBzNBzbg
 Yf/U3ztKrj1CS+7b7Eohk7rogzCc3jCjbui9rTkEXMWjl49fHLZhHgFd/tDeCTpD
 djs5PayfXDDKMHmhUr5Wv6LioMl5WTCXlwpB/CltScmEqVYNz556xA1GdGcg2loH
 z8L45w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu2uq0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 05:46:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-354490889b6so2759832a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 22:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775800009; x=1776404809;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=;
 b=e4B8/lDSFl+Od9LOxFV1t5To4aMojCo/geYwhAiim1Nf9dJ+6us3OdQX7tXkQp7gbf
 NdLBuN4pw+rGWiVNFngAI51ntunPYSVFUhZkmmJhuzav3r5I5/VbOr71KW205pvXbY9+
 ghqpwXe5VIC4p49x4j9sFN+bEWK5sfCoui/NMuIdFbKpDNZgLnR6vAGvnDrCLktMopZ9
 5VhTH5aOddeUm/Bk9G9zaTWu3Z/EAiCUtF6j+Nsp8w70AhfTG4OPHBDr6UFUs1mrs9lh
 9sUjJ7Miff4cmFx7b5CXkXF0rijnKbE9xibBXW22L1pWt+WN14D+s//Tm69nz+mf/1P7
 6bZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775800009; x=1776404809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=;
 b=SBRi4VIcX3DtsCojupVvJfFi6FKU08W3R8WW/p0mvh8KGhmCZhTfIS5UkCtof1ESbY
 HNqB/YP0zqEjlxwrqQ21IN8WckBvLb2ba3UkveMkPd5Fd3lv8q55UIFqFELZ85qyCqA9
 DaD0K4SLM1AMknQF0SjMXPQFBuAUnQ9om1c/iaGTxGAo2wIULsmJLYCLZAwSuMPhp/eb
 fupc3qqHAnZcr/kexlnFhqZFQNmQTAS+0yyYhuIihvvgm6tPkKSNVfLxdEdkaJ1iD4mF
 OIYmu+iaLvXVkIq5gmMz6Y0q7jxwaHudimErp8iAinkM8GfGZDQkYcZqgrU3GP+pP0ZQ
 4G1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOE3VmonB0zAHKWLKKNb2/w5Lpapcvol6u3HFRmzhhQeUlZ9+U3ZQ9OYbVVfWrzZ9xKJdI9YJmvV5MEw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzr289WKJ0ZXHv/RNh9L9+Vmof3wgCckYJ/kGr4MKAJuzUscPKv
 nDp4tYO+dqTxrjbezB3QnUfZNntvd2WUhnQ2UW/tyziKdF62KUT4OeSBmW7o9vewKpGk2RtdZ7N
 aVrZgMY+U5kiZXxgSb4KVSVJan2rcdcj5wC7eTebqAxqY3e/1e/XpO2cln3rDhnpNWJ4YFCaQXC
 vajKZAbrQ=
X-Gm-Gg: AeBDiesfHBBtnyUZazFLQK3v9YFGAA3rnSiGcdwzmmzjBPpRUsmdS+4V9tGbPVXXN78
 Y7epLpKL+1E3XdRNCgIa2MIRtKDzcEE7nk/vOTsCWmnVa3eoCArsGdjkl2cquvxlMfeW0Nl0ABa
 yo3JKm6vBnGhx2132damrSpioqnR5XZIP9hd1K5yU+n2pyUSvZjg7shB4hNlC+B2jVtJuifANyt
 mpqUCyrRpMSOMinso9O1t5bYykl4e1l2vUxiXYtKt/Z/fcAvrUL6KPEVZCm5fQHBlitnrmlWRNj
 PCo91sCygBLRXvLFQvABBZVBoUPuuPdJFw7+5F1Jmt4/ZTk3NhUllnu31Go3mHIV1sH9BJG7mAv
 3NMMYD+BJNeF1vszW1292SMfIK5E0/yRJ9c72zmt41VWqIhMeeQ==
X-Received: by 2002:a17:90b:5746:b0:35d:a861:36de with SMTP id
 98e67ed59e1d1-35e42853531mr2026766a91.24.1775800008950; 
 Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5746:b0:35d:a861:36de with SMTP id
 98e67ed59e1d1-35e42853531mr2026730a91.24.1775800008479; 
 Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2d4e16930sm14363155ad.36.2026.04.09.22.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
Message-ID: <7c244d02-ebef-4a75-b1b2-f55f8ce7c8dc@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:16:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <jie.gan@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-4-bc0c6dd77bc5@oss.qualcomm.com>
 <c7706c41-d855-4ed4-92c4-dca43c8f6d2a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <c7706c41-d855-4ed4-92c4-dca43c8f6d2a@oss.qualcomm.com>
X-Proofpoint-GUID: SbTRjWFXGqMK9wE57p65G3iV1wOjb_J-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA1MSBTYWx0ZWRfX5NNxToPAAMEn
 KlPDDerp1dB6JauYaIjadvIpKvPE4jvJDNkaCVV0Lqv92/x1Hpmr2K61kHlx1Gtsj+u8k5ITDmW
 k6hZlPUbrCHqkSFtFsGsJuylX47R4026mUxcCe91uDhSKAKBIlxmXM45PKVaiVDCzhwYdvwj7S5
 h5W+E2Rlq8qDU0aa8UEhs7im+YUsDixiC0dLa5rydclrDr0gM9xlcWvyN0K87timaPI7iuvw1uS
 lf2GP/gThHitA1sQNpzwRcpxqmtWRKtGEu2CJvlJ9sF2CY7JOJoiYd5LZeQ0ef1n5ZL1nWm3bk8
 zpe7BOzqPNqbworUEH71xu1AYouYCxCHU5OSYfNPb0ltvWiDivcNluMLeq9I0ZBFDEMIOyvmSxr
 Fh/E1qLn67rIUH45oVB0/8sqPZTaq5WqUB5Y/nh3GpqiJQUDQy43NxncygdC1ZuLj3O8dECsalF
 0NIfAurP3gkT4GBfPGQ==
X-Proofpoint-ORIG-GUID: SbTRjWFXGqMK9wE57p65G3iV1wOjb_J-
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d88ec9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=xLwlGchuUDJACbqrD4cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100051
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/8] clk: qcom: videocc: Add video
 clock controller driver for Eliza
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	NEURAL_SPAM(0.00)[0.860];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: E2D9F3D25D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgpPbiA0LzEwLzIwMjYgMTA6MTggQU0sIEppZSBHYW4gd3JvdGU6Cj4+ICvCoMKgwqAgZGVwZW5k
cyBvbiBBUk02NCB8fCBDT01QSUxFX1RFU1QKPj4gK8KgwqDCoCBzZWxlY3QgQ0xLX0dMWU1VUl9H
Q0MKPiAKPiBIaSwKPiAKPiBNeSBib3QgZm91bmQgYSBbQlVHXSBoZXJlLCBwbGVhc2UgaWdub3Jl
IGl0IGlmIGl0J3MgYSBmYWxzZSBwb3NpdGl2ZSBpc3N1ZS4KPiAKPiBDTEtfRUxJWkFfVklERU9D
QyBzZWxlY3RzIENMS19HTFlNVVJfR0NDIGluc3RlYWQgb2YgQ0xLX0VMSVpBX0dDQwo+IAo+IC0g
c2VsZWN0IENMS19HTFlNVVJfR0NDIHB1bGxzIGluIGdjYy1nbHltdXIuYyBpbnN0ZWFkIG9mIGdj
Yy1lbGl6YS5jCj4gLSBPbiBhbiBFbGl6YSBzeXN0ZW0sIGdjYy1nbHltdXIuYyB3aWxsIG5ldmVy
IHByb2JlIChubyBtYXRjaGluZyBEVFMKPiBub2RlKSwgc28gR0NDX1ZJREVPX0FIQl9DTEsgZnJv
bSB0aGUgRWxpemEgR0NDIHdpbGwgbmV2ZXIgYmUgYXZhaWxhYmxlCj4gdG8gdmlkZW9jYwo+IC0g
VGhlIHZpZGVvY2MgZHJpdmVyJ3MgY2xvY2tzID0gPCZnY2MgR0NDX1ZJREVPX0FIQl9DTEs+IHdp
bGwgZmFpbCB0bwo+IHJlc29sdmUgYXQgcnVudGltZQo+IC0gVGhlIGNvcnJlY3QgZml4IGlzIHNl
bGVjdCBDTEtfRUxJWkFfR0NDLCBjb25zaXN0ZW50IHdpdGggYWxsIG90aGVyCj4gRWxpemEgY2xv
Y2sgY29udHJvbGxlcnMKPiAKClRoYW5rcywgSmllIGZvciBwb2ludGluZyBvdXQsIHdpbGwgZml4
IHRoaXMuCgpHQ0Mgb2YgRUxJWkEgaXMgYWxyZWFkeSAneScgYW5kIFZpZGVvIGRyaXZlciBwcm9i
ZXMgYXMgdGhpcwpHQ0NfVklERU9fQUhCX0NMSyBpcyBrZXB0IGVuYWJsZWQvY3JpdGljYWwuCgpQ
bGVhc2UgZmluZCB0aGUgJ2Nsa19zdW1tYXJ5JyBmcm9tIGRldmljZS4KCiAgICAgICBiaS10Y3hv
LWRpdjItY2xrICAgICAgICAgICAgICAxICAgICAgIDEgICAgICAgIDAgICAgICAgIDE5MjAwMDAw
CiAgMCAgICAgICAgICAwICAgICA1MDAwMCAgICAgIFkgICAgICAgICBkZXZpY2VsZXNzCm5vX2Nv
bm5lY3Rpb25faWQKICAgICAgICAgIHZpZGVvX2NjX3hvX2Nsa19zcmMgICAgICAgIDAgICAgICAg
MCAgICAgICAgMCAgICAgICAgMTkyMDAwMDAKICAwICAgICAgICAgIDAgICAgIDUwMDAwICAgICAg
PyAgICAgICAgICAgIGRldmljZWxlc3MKICBub19jb25uZWN0aW9uX2lkCiAgICAgICAgICAgICB2
aWRlb19jY19tdnMwX3NoaWZ0X2NsayAwICAgICAgIDAgICAgICAgIDAgICAgICAgIDE5MjAwMDAw
CiAgMCAgICAgICAgICAwICAgICA1MDAwMCAgICAgIE4gICAgICAgICAgICAgICBkZXZpY2VsZXNz
CiAgICAgbm9fY29ubmVjdGlvbl9pZAogICAgICAgICAgICAgdmlkZW9fY2NfbXZzMGNfc2hpZnRf
Y2xrIDAgICAgICAgMCAgICAgICAgMCAgICAgICAgMTkyMDAwMDAKICAgMCAgICAgICAgICAwICAg
ICA1MDAwMCAgICAgIE4gICAgICAgICAgICAgICBkZXZpY2VsZXNzCiAgICAgIG5vX2Nvbm5lY3Rp
b25faWQKICAgICAgICAgIHZpZGVvX2NjX3BsbDAgICAgICAgICAgICAgIDAgICAgICAgMCAgICAg
ICAgMCAgICAgICAgNTc2MDAwMDAwCiAgMCAgICAgICAgICAwICAgICA1MDAwMCAgICAgIE4gICAg
ICAgICAgICBkZXZpY2VsZXNzCiAgbm9fY29ubmVjdGlvbl9pZAogICAgICAgICAgdmlkZW9fY2Nf
bXZzMF9jbGtfc3JjICAgICAgMCAgICAgICAwICAgICAgICAwICAgICAgICAxOTIwMDAwMAogIDAg
ICAgICAgICAgMCAgICAgNTAwMDAgICAgICA/ICAgICAgICAgICAgZGV2aWNlbGVzcwogIG5vX2Nv
bm5lY3Rpb25faWQKICAgICAgICAgICAgIHZpZGVvX2NjX212czBjX2RpdjJfZGl2X2Nsa19zcmMg
MCAgICAgICAwICAgICAgICAwCjk2MDAwMDAgICAgIDAgICAgICAgICAgMCAgICAgNTAwMDAgICAg
ICBZICAgICAgICAgICAgICAgZGV2aWNlbGVzcwogICAgICAgICAgICAgICBub19jb25uZWN0aW9u
X2lkCiAgICAgICAgICAgICAgICB2aWRlb19jY19tdnMwY19jbGsgICAwICAgICAgIDAgICAgICAg
IDAgICAgICAgIDk2MDAwMDAKICAwICAgICAgICAgIDAgICAgIDUwMDAwICAgICAgTiAgICAgICAg
ICAgICAgICAgIGRldmljZWxlc3MKICAgICAgICBub19jb25uZWN0aW9uX2lkCiAgICAgICAgICAg
ICB2aWRlb19jY19tdnMwX2Rpdl9jbGtfc3JjIDAgICAgICAgMCAgICAgICAgMCAgICAgICAgNjQw
MDAwMAogICAgMCAgICAgICAgICAwICAgICA1MDAwMCAgICAgIFkgICAgICAgICAgICAgICBkZXZp
Y2VsZXNzCiAgICAgICBub19jb25uZWN0aW9uX2lkCiAgICAgICAgICAgICAgICB2aWRlb19jY19t
dnMwX2NsayAgICAwICAgICAgIDAgICAgICAgIDAgICAgICAgIDY0MDAwMDAKICAwICAgICAgICAg
IDAgICAgIDUwMDAwICAgICAgTiAgICAgICAgICAgICAgICAgIGRldmljZWxlc3MKICAgICAgICBu
b19jb25uZWN0aW9uX2lkCiAgICAgICAgICB2aWRlb19jY19haGJfY2xrX3NyYyAgICAgICAwICAg
ICAgIDAgICAgICAgIDAgICAgICAgIDE5MjAwMDAwCiAgMCAgICAgICAgICAwICAgICA1MDAwMCAg
ICAgID8gICAgICAgICAgICBkZXZpY2VsZXNzCiAgbm9fY29ubmVjdGlvbl9pZAoKCgotLSAKVGhh
bmtzLApUYW5peWEgRGFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
