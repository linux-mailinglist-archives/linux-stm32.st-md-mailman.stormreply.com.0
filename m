Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB3XOdeYBGqhLwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 17:29:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EB9536228
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 17:29:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6AA3C8F291;
	Wed, 13 May 2026 15:29:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 502C4C8F290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 15:29:25 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64DEsGsF4159972
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 13 May 2026 15:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=; b=hXE7vLj3yu7n94+G
 2NSWc/Fje9lZq+7gEbw4ryS8rUQZeq1Jnkz6s9BIeQgmQQboDMIpATq4fN7WEAHi
 lDUwhBnUF+LXUiMGZmyWsR7eWTWh6jDUrkLuHqnlx0jtMV4uGw+/RknDesx24Jdt
 VqSsU+X3fWOvt+lJC7fSW96xxijDGr5oj3DkAzJtaf27PByg1ZO5P1pO015LWGqB
 9fOZpCbZDYnT1nSpdMWhQ2J/s+4bdSzfEyGWocGG7D4At3DJBt0QXUiwTgXOGQUH
 wOLDA/GoNbQYa+6cg0SN28f6OkYLLWLXIK85mKr0MzaFGG/WrSNVjrY4GQK4R1cv
 zea15g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91shp4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 15:29:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ba3245a43dso61426045ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778686163; x=1779290963;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=;
 b=KJhbP2rA+Gozb3L90hELrQo5aC1S2f3NCotBjyLiilHL+43jPqypEoxiAQBcxO7gsI
 3npqWB7oNd/EUgdFbC18dpAV8WvnYax+odRMOjOhDCj9j7rOk7a34H93y5a0ie+pAeEo
 TUMAK3KJWz97f/4qywHeVoqFEibFWK7D2AtcnU+2W3PmVsmqqyRxDWJ18rqV4NkivM1K
 WZqatPskzmPMR8TbuH8UdOpRPev1rRYivxbmM0heiuIIOnOXhXuyk/deEvNvZKZkKAGW
 3aQEQltc/LNEmfMqvGYUgrjZxPUxyIfKtc01huQfnKv4OSMVjEWB2IIMzjGcYx7d5QU0
 ftWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778686163; x=1779290963;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=;
 b=pO96ig4xyNNBsgcFZPFWeeBkgbdF+7kc8ScMFSRrQG0z3uiUdqTQ+9XvSKaBZbORtO
 i1nma6Sd+h8PNWYTTLg8O2RfBdAe4PScN7EpEPQkxdGXJRUW0NEJmNcB+olsJp9MiPbk
 EwwDvPulkgvrVivVPX5fPOFbll/l3Y1dc3TQn4/OL67bJjScZuUFHKKT1aI4IV3crsul
 n1QXgTCySHJWsU7DCY126WQOHs/9QRtdN6z/H32NyjiQ3mZ6+Q95SvZGOLeY9B8DCE6E
 l62VcO4vmDAk8c7fr9bNTUkVL2RCMNKgcA18aUKRcmx1O2NgFHv46tdBbebJvGJVa8sZ
 bOuA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/eNXGRexUbXZysWRpXrCTo9Q0V3IOEVAJWpUl8OYf9CVNgvXLO3zTLa7p/H/AO0XcIIQgZlb76LK9FKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwnCJtq0kOUwa0pMGNoHcYo1yRRWot2yQyITXpmGLU0zfWYjBGG
 8uGXIPK1awV9qfOD2/Re+S+uX+M17zgdRSTtjwfBCSw9rFpsLNjaCYFfWYKKBYZWp12dVGm/ND+
 RGfNreVxEqhkbsC3MotRgZdNKkcXLposs9lH1zXKepeLRq838pnSxT7mxQLHN81tXPJPwvOsocZ
 oFmMswJXs=
X-Gm-Gg: Acq92OEeziPcX6+dQ2eM46yyNAiDdxEtJjDy+zpo7vsB7c3top+eQcH4p8o7fvONo4E
 JRruQDhSSFPRWtEZuHyUBecQQl2DvDdwMKl9YP1Iq9+D8pkopnqU80wce98bHuH5TFhZpBqEbwo
 JsPlcAh1SVT3pa3WAj1VMd3DyLu5zzmWuy5ru9KWvakHxaYFy5Shd6RnyDVA8pWB3QI7jaj/0xx
 B5q9RoyYu50t7DxAwgt9zGxe7FHLQiYfS+wmgfSytc8aPf7rep0STc+qWTN09DBN+zRrYMTy5kM
 EoEBMDqlCvda+jmaIcH7/wwhhRyHw55hIfLcsY1chZylbKe+lq8cqR8g/EwQ4wlnIo10XNl84dd
 xgZN1vzJFI9rPk601gGJCOmJ8VNeIBP1ELrioddSA05zMRqfIbQ==
X-Received: by 2002:a17:902:d2c5:b0:2ba:9e1c:7cbb with SMTP id
 d9443c01a7336-2bd276e23b7mr45319065ad.34.1778686162697; 
 Wed, 13 May 2026 08:29:22 -0700 (PDT)
X-Received: by 2002:a17:902:d2c5:b0:2ba:9e1c:7cbb with SMTP id
 d9443c01a7336-2bd276e23b7mr45318595ad.34.1778686162197; 
 Wed, 13 May 2026 08:29:22 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.169])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e35bcfsm168295585ad.38.2026.05.13.08.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 08:29:21 -0700 (PDT)
Message-ID: <dc78ab37-c62f-489d-9497-998ec11080d6@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:59:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7CzYc8dzNerSxNV2StmG1WB5yqKT_VXZ
X-Proofpoint-GUID: 7CzYc8dzNerSxNV2StmG1WB5yqKT_VXZ
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a0498d3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=QCtv3gAnLEb/jX3y9W1wMg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DeNt0BJpUpdqGQuxoTYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfXw4/j4iXcf1ny
 lY8HQGqcUBB0NjL7lRP+Ac4olgFduqG5VG4fmSXcdy0fFriEmyqcu59Mp8dGVk8D+wOMjFpldQP
 Meu/CyBtlcfTNY4o1ioiFpkfUVcKJFhL8U11zhC0oLK/MfJx1qBwqMsrWZal5NPJg19sviVytGQ
 YRn6TX219L+leNkjmUgft/lOcdr6dRoMLhyn7eudMBlXPMRTTkzvAgz0dniyujjT/1hPG/3ThpX
 /0BRKJxdJ5E76jM5iz+ISndQ8Df6us1vMVTjBEG4P67EvmHVqfLMePT/SqbPoJHSB0Is3gPR965
 rSE2ufO4x3/Mx+i/B84R35rstDP8mTvaKFz6FQLzV6EVd/aXY4pCUNfvHMMyc/wFI7svKr+7ojs
 lWZnraEW3jGETDkSyMcGTkcrVCs+TeLUopJCcrmwk2k5SiJzc27Hp/zVEOph1r2GufOR88xjydb
 Jq1ncUQcbT/DPjST2Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130158
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/7] Add support for Video, Camera,
 Graphics clock controllers on Eliza
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
X-Rspamd-Queue-Id: 92EB9536228
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:luca.weiss@fairphone.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.809];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action



On 5/13/2026 7:53 PM, Taniya Das wrote:
> Add driver for Eliza SoC camera, graphics and Video clock controllers.
> The camera clock controller supports the cambist clock controller and
> the regular camera clock controller.
> 
> Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
> and MXC rails dependency. Since CX and MX rails are already ON when APPS
> is active, explicit power-domain voting is not required similar to Milos.
> Hence extended the Milos camcc & videocc documentation bindings for Eliza.
> 
> The patches have been tested on Qualcomm Eliza MTP board.
> 
> Changes in v3:
> - Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
> - Dropped the defconfig patch and included the drivers as m from Kconfig itself.
> - Update the header inclusion in the milos.dtsi.
> - Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

I missed the ordering of clocks in the milos.dtsi. Please help review
with the latest series.

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
