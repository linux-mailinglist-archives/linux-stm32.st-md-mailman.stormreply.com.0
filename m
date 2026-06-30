Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eQeIHSHOQ2rdigoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 16:09:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 025226E53ED
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 16:09:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b="l+ZGPTR/";
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=LqSlGDpX;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1248C8F263;
	Tue, 30 Jun 2026 14:09:36 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B0E5C7A832
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 14:09:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65U9muBV1604757
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 30 Jun 2026 14:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=; b=l+ZGPTR/vmlcOdho
 OUfrMpbjEUKfVs9bvMHEcwv6H4b39fhh1wPo8Dm7jgzukwZl/PSbgsaLZaMbzy1q
 ITBLEm5XdUUIN0mCuUOTCB7l7Ud8iuA4d19qSvbcDdTySF0RHqxCfRI7LlxFCclY
 0EffM3nelQKouYnkvfVvUDP4xJQKR8H7bSwkj6FYluvSQny+v5SzX21ZTjUMPMR+
 v5XhSEA6kQ35BepHizcN307Txcn12IBPKnU7+7xsX603GaJ8XSpOCZGZSyqd5Xhh
 2RTf4hC8Emv9RIawxllPdEslvboyos5lszxELdnMOugQX3nfKgPQomvfgZ4sXLPa
 iNlckA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfk2cg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 14:09:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-734f7d8bb37so441043137.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 07:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782828553; x=1783433353;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=;
 b=LqSlGDpXyIwrL008xrcVwKkx9swNlXHkDr7AqGIl1MW4u9WXd1pULJx47sVmiRVHl5
 7PBRoCBvZGw+WSPuArnYvwA6kMz+lK4hoL/0TWaed4MyKhh8TXwcGKhOoKOY9cK2VHg8
 H/h4ffw8+2WNPbIMLIdgceSD2ZAJ4Uzx+UWnLsAVkkTV99l31CmDgaXNPvLRu1fDIQjV
 x+AsU5R6DQkSNibA2keQIFRhIcbpeUW8cVWFd3xywL2neG18oUHn6BXvc3uBFKoa9Vbp
 I9wQIuBqGcH47rAC8Mgmy21CGwLtMJqj2CYt144iMmkTjKGAM1qqxbuhuULbMnU3UIu7
 lKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782828553; x=1783433353;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=;
 b=S7Mcy2f28KCn+mVb0VdX/qVmZeghAsNdez6pAMBy4LXD8glsADSk1lXj77MmFFRw+3
 lx0Qc4jpETZ5IYQfkGQTMJvbAHh/sF90x1xZ4JAIDYhAu9dgzaoH2sjEhb9/6cR4+ieU
 S3+Y7yU1sIRHYG4EY2HC6LKuIWvqh7MEbJxpKg7ya0lWi4JukE9HxS8QUthkvsmuQnPU
 kVUeBKUMAVy9Vtr/Iqt2Vh8+nOLKnX+WPH/R3aDHxDyQZLYCZ11hNGS1wSafkXCWStEx
 z3uOa7+V6p85PN0c6qsChjeXHsDiR5QGwqKz9r5MmQ6OBtn0CFGmvDhHz1wqegDcJHuN
 nIPg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqzfrUD048pj96FWNIg3zddCegAy1vPMOXjfmovkHkhGZDFiTu3i+1j2ybX2NjZwzPgkAORqvX3TMpngA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YypQLZbwv0oZZTt1WKl1GPjCysXktDSG9bMdwgdYhB/ncXj3OyV
 k88AIIx/Eog84BdjWh8mUDRyni05LYvrXgSUgljbz8CkoRv2q0XSLJ0/yGtOB+MNKiLUUNe/g26
 IXa5kDewWBqJsYG/Y5HsA/Q8KLzhITTRbus9vNGd1nIsIlbdI33qAwmrlNIzwzGcRzDKSK43ump
 HkKP4kha8=
X-Gm-Gg: AfdE7clZlJrFMgI871Sqod0HR9jTh0jjLCJnDFCqCUE4OwQ2RJWRK/7LSa48cjh3TRH
 tOEi864rBOqDDLuJg+RczUstzq/cU34lQCHKHxlfAfGxWmFeCfKQRvOIw2lNyURE0+NYrNXKml2
 N2XkbE9VYCQVRJHQgb+WuwHcJaqtJEzCWXtQeI8SjbPUS7WIb93aEQBRm+zja+lymI3z4jTfyHk
 iWW0zFW/AeZO0jO0u546PZKd+lqzyZst1/I5a6G1aR+mwcERq5dLkOZS7FGrz3YFvJPJJjdMNAk
 8xs8WtBOofIQMoHogE7qqxMXspKSN2e45HYBpzbD96vQp/B39fjQgJ7B63CeBxMuJg5EpjEbRfu
 c5DxYEVOEfYacrT+4psRmSFHMn5hf9g3XlgU=
X-Received: by 2002:a05:6102:8081:b0:72f:6669:286a with SMTP id
 ada2fe7eead31-73a363e653fmr674937137.2.1782828553181; 
 Tue, 30 Jun 2026 07:09:13 -0700 (PDT)
X-Received: by 2002:a05:6102:8081:b0:72f:6669:286a with SMTP id
 ada2fe7eead31-73a363e653fmr674926137.2.1782828552777; 
 Tue, 30 Jun 2026 07:09:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1288f0cc1esm135860766b.41.2026.06.30.07.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 07:09:11 -0700 (PDT)
Message-ID: <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:09:08 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cH6zS_WMaWkcZU6VZXMDFFAPVzalFq08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfX2FHkvcETL/jx
 GAKmiN4rApNSK1U2+KvSbKCGvoU8QdxFCtBJeytg1fQeoxJktrMPARP0RvjIuRvv5O3E7wKhqTj
 yEZpCHdyjJIl+nt+EaAl/5hZEcT2dOj1LClMYCyUd2LOh/CvrpJ5FLLrbp+uj95G7h9VTtAO/+S
 NfIpCsFe7T/WfqRbMO1LEPaFtywtv0bDE7E5foj3URZbHUE+UbiKZfGPB+tnTwneHYNGYfdEGSs
 T9xXOW2Ypy8Xyr+JTMu8k9D5X5VoxDKLDOVIHmmoHGeN7mYiVbcj93BJwK43KWc1evGhVeROiwk
 ONFhVUdkT6Dqel+MEaAA8Q7GEKt5w2xzsalQ8n1n1apAXScDIpOZ5dXdZrYOxuav5QjyL/hZZ74
 QDLBTWl3pelqjUgXoL0cFFtfgbePGkIq48obCoE/F5Xi87Y67dnPWW2CU1HMtsHHos5HU0n5WUT
 jLzdeOoLDevM/aeGrAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfX/+lF3ZyalBXf
 /SRtd/cKfKu98sZciv4QzKwB0gwxBqW1BgGN9V9R/DfsRKBRIOXmlvNXqDRSJAUCltlXJpgHBZY
 OOCxffHWeJQIjsJcdNFtLqQb5rd1jDY=
X-Proofpoint-GUID: cH6zS_WMaWkcZU6VZXMDFFAPVzalFq08
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43ce1b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6vCOFkJVGQXElGg4amEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300132
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
X-Rspamd-Queue-Id: 025226E53ED

On 6/9/26 5:02 PM, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Almost all of these nodes lack power-domains, meaning the
aggregated performance state requests will not be translated
into RPMH requests

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
