Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bT8WG32oS2pLYAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:07:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C76711069
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:07:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=QbOWvfYY;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=Qy115Im0;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FA27C8F273;
	Mon,  6 Jul 2026 13:07:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F6FBC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 13:07:06 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxCZ0238118
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 6 Jul 2026 13:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=; b=QbOWvfYYxMOrrPp8
 bcZMRh5+gVIjxIia+4jGtN2gxG6/HBu+g2SD5G4FQiPmmCaZXxIuaxA17qiHd9FY
 JRMWrQCauBJjo0JgYhxypmj3yRmPWA3hDSD9tWsz7XIR77upkB0J+SsOrzvCRmhJ
 SlhobXzeowDnyvqIfgf3DuDSC53V6bKAf64nWQ23M4oSk6D2Sjdxakos63QbA+bL
 2J5WHHhpOPLcZl3/ruCBunw/xfgrnU+PPFzcdVn/iZHkW4+P/wKT8Vs1Me9IJjl6
 XFMYCfVPI2bjhGBGcfAnSVRSd5uhcnTaLDixCEPfrrm0/fYPG0BruYyAhcDWPjj2
 XVvYLQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t892yu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 13:07:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5bdcef5085eso113807e0c.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 06:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783343224; x=1783948024;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=;
 b=Qy115Im0lpddkn7wL5Sr3RdH9YA9piRujvGxtXwcqO7tWFVFV3emP1QFObD5f/Wm9w
 t/AsTznTZDYkkr1StZNsCrCMwZSMZLNK9ET1ikzstYhJ3/EBV5dtZKkyjD+hv5KyNkE7
 aOrrocT+7YgL9ann5v6NEMYZ9jHUHR70v74jXcQMf7b3RqvtObxfLRRokv2Qb+43zw2X
 CntQ6QPE/r1vs2OJZUpfPv8l6edLAIpAbpHjUFfvSg1J4lId1YFVlGbyWj4fKeNqoUwO
 M24nWr6Kv8NmsnIvgn21VjNW0YU5AQzXMwWj6TJuvIsbm3F+3pqwL8hwVQqiQiUf+RWs
 iWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783343224; x=1783948024;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=;
 b=HJqoXDRd1UM4juxT9EiBiqArYTABLkyn9sxzp0M7u7WBIiztlzkK8VzYg/OVm9FQTw
 tNfXdH9fFLw6RWkg9ZfHQeFd5BeSCd2ACbdciFsF2kS3GC/laLFStu4ERhprOgvBknPU
 KxWkmHNc2KFROie4LCO2S/3oxKhVCLlL+lS9TV3TCQnuSU0ZBlYrpN7mSfYDIFtv+SjY
 7l5SKlXWC2rGnGWDkjwbR7RVaT3Tws1f5haAJyZzQgfnWz/Et24yn2J1VInW0+pp0E6P
 oeBYcFgIipBtgT5CbG0aoj9bL7WcTl08pAap/joatgMGc/ZoCcJ3UNJixmprrd+QHMqO
 Nc7w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp3tCiOuEvMoQt7bJILmTAiD2AolyLa1+DPRYYQtTpCkQ3m0KALU014ZWXJGI0vhTYq0GUqKgemSfROiw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBkbaDv1hNT3ZcHMrqYCq4uIcFo9ZnO5ERBR35XMVzpi9pHabO
 1NRIxoZ0Sc5PZ0JVzKlVDHjuOqc70us6uJkth0LIhh36UHgdt02xJ5c0GhczZYadWF/vlnzVdU/
 CZC4ucKKHgDXNzJRqOwrve5suCPePTshDvqPojax30HOkq7RuOwXZh6v+N1h/jg4i6wtnoX/lKi
 BcSXD3oRE=
X-Gm-Gg: AfdE7cnQzhrPUBLiACfcr3i9qpSQuFxh4Jlk+I27dTw/aRZ3mbtxcoJSYtLru22q/xo
 2x8nKyHLL91geA3nSa3ykIae7zBpLo61/mlfZnD0FSWVaHC2whWIxK2PpMHW8WpXjMyCRZ8iqFW
 t2IA1fU9oYschh6Ar54y5ZDL5ehZFbPqv5DMigpVr+zuaPX8hNCvyr1UIVe3hXGMR5kKS5f70ax
 GZXSA6ZInQsJTREvK4Rs6dzoSWgUyWTcgBGrQBJ8TOIXQ8OuwLxpSaK8wDtpll/KI5IMlM6XLmH
 qAlwX4gu0Ay/hVv46xOdeSuJLVCrYwQQUxWL7ug0jUJBCbeOwYfwFbdVpl+xv/ePjK8ZUSWOjFM
 cbv9Ja4IaRtt7vVN3SBMLGcONeJFY62uEeFU=
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id
 ada2fe7eead31-742079e8eb2mr1233297137.7.1783343223700; 
 Mon, 06 Jul 2026 06:07:03 -0700 (PDT)
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id
 ada2fe7eead31-742079e8eb2mr1233219137.7.1783343222369; 
 Mon, 06 Jul 2026 06:07:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69a19db05ecsm3945114a12.28.2026.07.06.06.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 06:07:01 -0700 (PDT)
Message-ID: <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
 <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfX+UFHxmM4Ldc0
 fPz6ya1u873w+k2LjsjCEDTR9+fcQQoUdUAnTgWnmhnIqR9sksQFFdCw28AqZgkpfUnmUKvZ50t
 fM4ntKV+YY1UWcSbulhXMM9iFZqLbwo=
X-Proofpoint-GUID: vG5pqsnLZdq1o7vaEzy44MCy5Azkpd7J
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4ba878 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uHYfjYNGAha-st8cwW0A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: vG5pqsnLZdq1o7vaEzy44MCy5Azkpd7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfXy9TNQvEas+wk
 WrR4Fb8YbfEzKCHKp3Dslj4xmfqS+A+H/QmGEP17u6UibobWjNgwwbCvoxGJ1JKfu0250xuBQGI
 qlC5ra/fV7glsD7NcnZXWqFifZ/3J6zbPEfsTcHttCq2lNdS2+Gc00p9Tq3BcrEc8PBxSLQctRS
 SwiOk2VG9kIP59JNMIu2/aSTU5Jl82U857E3DgEy5QJDLR/I0YQCP80MK0GZ3+5TPtZxc/V4+lX
 PvymO+Xh5ZhdynvsUHLh+Hc250zKYMOFfcq1qqGDCjGOC0sQ1ACbvcc/5s/E1subb7NC5EpUuw9
 /nBJ9yKy3iJr5Cu9Il+i7zm9BdFI/x5WJYxI8ojIx1poSRphRU11D+qcFEz0P7uZRk/G/swh1qd
 RWw5f9FQmOc/aroNP8JTAzbFV+BFCj2TLtBq3g9LHLZnh5SVIKJTSVGM6FL/jsbHL0rTC9Iq5/5
 /XNA+fs5SUJuZUJKtTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060133
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 7/7] arm64: dts: qcom: eliza: Add
 support for MM clock controllers
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9C76711069

On 7/6/26 7:28 AM, Taniya Das wrote:
> 
> 
> On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
>> On 6/9/26 5:02 PM, Taniya Das wrote:
>>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>
>> Almost all of these nodes lack power-domains, meaning the
>> aggregated performance state requests will not be translated
>> into RPMH requests
>>
> 
> Konrad, all the clock controllers are on CX, similar to Milos and does
> not have any special voltage requirement for the clock controller.
> It is okay to not map the power domains here.

I don't like repeating this every two weeks, but each consumer core
may need a specific corner for operating at a given frequency and 
the way that is conveyed upstream is via a hierarchical structure of
pmdomains, where the root of the tree is provided by the rpmhpd
driver

If the connection here is lacking, every requirement specific in the
OPP table or in the IP node via required-opps goes to /dev/null and
RPMH may do something between aggregating to a lower state (because
there's some other node voting on it by pure coincidence) or shutting
the rail off (because there's no votes whatshoever)

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
