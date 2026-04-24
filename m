Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJB1InNY62nkKwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2026 13:48:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D9045DFDC
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2026 13:48:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFF51C8F297;
	Fri, 24 Apr 2026 11:40:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82CA0C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2026 11:40:20 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63OAF16l2447356
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 24 Apr 2026 11:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=; b=kMcXYtU2JntMEEVO
 vzxBHYitkpG0WikSf8OZ/TXJl6KZ9jjhaRbOODsSjyJlXFlG48/rS7Fck1x647fv
 fwsblb0RLUjoQCY8RhGr0osUsuf/pLR99qOYB4djWLOcNP0nvtWjbrqy7CRL2deZ
 F+BD0eLyge+FHFd2zkaH9rWqbHTslKQCSjtBYxPumXsqXZfrgrgyqJPai1pQW/y1
 3OpzEDSGU4LAVNIih+bGsmC/L4zF46teE5m/SdYZYoOgwzTROGYXJf3Do9VDHLLh
 hw8vzazFn576CfZd7gbGM995J1swZI4kHpSc61GSMZn0jjHZYcEGpzfnJ/7yRiM8
 W4352w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr6kprbkf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2026 11:40:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8b02ea0c595so15115256d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2026 04:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777030817; x=1777635617;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=;
 b=FxPSRP2VgkvNn32HB0cV0kKTJEaI8r0acwAc8DwKwp6/uKFMD9XxwV6ulsvYHm5HTn
 GoQfCtC5jDKPABQtCEyVbOJ0J9FZsVk2xNmPCU7jPgePUe/AJFaQfy/6ANdc8y7bBm+P
 DBswh7ElFw9fdMpdLmmehHlF6Hct5orNvwrqHX8ZX07/mAk+0gC57xcgq6lxVDL9bjtY
 q53ESx9q1nDvsk//mdn51wfuO7pXvLwu3a6WFdEntztXmN7ftgKwmhm9rsiwWchF/S1P
 cxDfIbRtxkMgpma1QGhaOrxqehe/X+3nuGISCzToRQRSBOo5tKRgIKyYglWurYD4lTjt
 pDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777030817; x=1777635617;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=;
 b=BXarvxlpShM2994xAXkI0ATpsDQwgbxEFXIWg2V2fGgyDDX+1q3NGpyepNGLU63I3k
 5uNteaTSofaDqs4iuzCj5wsZhNn8jJpId5i5EJyng29YLinlABJ2N1/37YE9UPcAJ0oN
 hYZzuaLih7P2wvhiTKtRkqWAzxD/4Etd0le641wsph+pphm/s4iGgEkhzcoLzThLLqxv
 PymMtxsbKXobU89TgJdY7wR9Q2mDQhC5rkk6kxfs5ciFj90oi74uhXRcuKhDYkJzvB3h
 zkGhGYbXWukckWupV3OJHzlguiNy6DxelKkKl9x9AopWlmXp9IEygHoYUcQ1ahGrkOib
 r9vg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9RZyBN0232meiOIfP19Kdv18+XXcD7D3fkdMxhBK1if1JNKY9tv4uUTHrouRrui5Kh656bzvCJk3P0xQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz1mCeUlYCT/0H/0/UUo/mtkAGjosJRSj1b69lRuB4zHbEj3Ft7
 6aElPH3vsq0qIhMDOd6Y99au4D3DLKmtUAunBRK7w+zIkAXjsi5qORn6PPS0LsJ5UxYLUKGIAE8
 497nXydH5FM54W/AfzsSn48qlVyiKoxXrwJPD0MKcWcp91mwB12nYLoYE18UIXArt9/vQ+OYwT3
 Xjp367B/4=
X-Gm-Gg: AeBDietwG5qgyDNWU2MvKiyO/MSF1T3QYYjzOs/dKAJjTdurgzPiOMraMWGRoIcsKDg
 +jiQX4WTF+4a7chDsUffb/0sPipcZmtlfva+NWyqvWIoP0isLMCwlIDI8QHg0+ai3/nvaQ131ik
 XhjO4yHxLHv5znH9xf+VDSTGIv7/ymDqAny0abQbIthP1/0zcoUkuWOuwAxVRdTBCSJ9Ec8VaNd
 evWCcAbM4m2+9fmqdAXz9kX7EFYALDgwxnvNL4ThPfMEp92B3b4EOw9qIFB7sU3cLzHOq+5Iz4L
 mE+Ox3uYMXiaHH1VzvqGGMdSFSEyVS2iX68L/9WpJcL5eH4PO7rZdtk4qQhMcq0TUbZhG1ZPG6x
 bV1/0tIBXkMY9gftBoFEMrpop0fHfU9EP0FsZDR4+BPhDJdt2bedZ2HkjrbRaNqIQzHVEzgsYwO
 jhOVOyH7spm44/MA==
X-Received: by 2002:a05:6214:411a:b0:8ac:a91c:c9c with SMTP id
 6a1803df08f44-8b0281fe001mr342499436d6.7.1777030817379; 
 Fri, 24 Apr 2026 04:40:17 -0700 (PDT)
X-Received: by 2002:a05:6214:411a:b0:8ac:a91c:c9c with SMTP id
 6a1803df08f44-8b0281fe001mr342498976d6.7.1777030816944; 
 Fri, 24 Apr 2026 04:40:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e7dfesm5896580e87.71.2026.04.24.04.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2026 04:40:16 -0700 (PDT)
Message-ID: <b0690213-da71-4b8c-bab8-8581fc3d0211@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-5-bc0c6dd77bc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-5-bc0c6dd77bc5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cdDiaHDM c=1 sm=1 tr=0 ts=69eb56a2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=whjPl3NbLinN2m9j5McA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 2gUMc4O1ET2zEsXAnpiBPqZ2DRPz-pjs
X-Proofpoint-ORIG-GUID: 2gUMc4O1ET2zEsXAnpiBPqZ2DRPz-pjs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMSBTYWx0ZWRfX2wulll/sGZDu
 9e6lea20ouirbK7A40YRPwXvT8rLvQr2jkCoRMr5Xrg0NgBT864LD4SCSTGfHj0s5gI05Vp26no
 eEXbXrJjOC0wE/LXdrpO/1Gd4UACRWF/8PXolpFNy6JjJpdmWdKHTmFHv8VmE7jLu4tYDNilmct
 4UsSYq95ckTLR2bMCFm10zsFX3hBpOpec9FX093zRPKg89Oj0kCn4KnDCYrK84t1EE/AFDa4qFP
 3N5fTCspCDMBMLwencmW+//6HOSg6VV4RcsagTFNCbIUrzb1SMwu2PRF1PgduV3hBP9O1UvUaLK
 O3LKO7n+Dbsur1WgDcize/SvgyvKORG0ZpQZ4j7IlaTDyJzMckrTf+5SQffnMM/O7E7lCQA99Tg
 Rwaf4t1DxWQLYXG7U2PKjOJIW0XpT9TsStDczQ9grIteRHoWM/hDw62dc8hX/g0Y1PQatOyJ1OO
 iaVyZRe5+qBH2RNULLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240111
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/8] clk: qcom: gpucc: Add GPU Clock
 Controller driver for Eliza
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
X-Rspamd-Queue-Id: 36D9045DFDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com];
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
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.923];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,st-md-mailman.stormreply.com:rdns,oss.qualcomm.com:mid,stormreply.com:url,stormreply.com:email]

On 4/9/26 8:10 PM, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
