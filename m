Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJK/L0OGFWpXWQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 13:38:43 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5583A5D4FE1
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 13:38:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E35A8C5A4C5;
	Tue, 26 May 2026 11:38:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBFA6C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 11:38:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64Q9Ce3X3658354
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 26 May 2026 11:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=; b=nOIOhAehciDL0r8X
 yax84JZEqX9g+t2judWawswD2Uerl1ZRRmEoIDY3F49rDrIMpX+nQIJV036GH+UK
 n9GPI+W0ZH9zTRySlJ8ihStHDQKr7wNUGGYtEG5QAo5zEe5BNxFrVstAjhMFQqhR
 GGm9pMteCbYenttuAHge1wF1wJjOdE8MHm28ur5+tWpZ2oJqnv3w3VgCaFp1MvWk
 m2knHSnGOsgJ3pN2y9eYgspWZftFMBlhzq2a+b0cZwuz1szHo+v6DGCCi7QujOX0
 7ophqcMsUtW9GbcDsH29o0b8uBE+VcR+SavBsOc4M1ZdcZGUtsMxfpOIdCSyYvyM
 zjqHUA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynbms1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 11:38:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-82fa860e71eso5252636b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779795519; x=1780400319;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=;
 b=HXUn6dldblao+N6+p/Guy076+g970y7kbhdNI22vk5t6yYI+Ae7/YkQMgzR0rq5T3r
 P40l9cRPFPGS96P6V9oJfPYLPKv0Wrw+ogzY4Mw2fM/nukGB9sS5GC6nqUXa0grYaQeb
 kYkEdduvxi46yO2reHYfO/kFn8dZhx0ChF9z9QyXrbkEC6kFx4LcU0juCKsbQGNqCdrD
 oySEw6ekvO8KT3sKfA2FHQ5XN3bBXMQ5eP8V9DKfoT4Ut2KGrkuxOhpjYc7daqU+p1iY
 rXIhjvRT84fmea+jXZWlOdf3z1bLFlZGZ5dfgpsTr9NIAypjfck6jjuCJ4bvdz0slIaY
 vvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779795519; x=1780400319;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=;
 b=cM87yI9dYA7uox/hpoR58e2keWXUEwYVsxcbhCEvBYBoeV8zY46DHWWsowR+4TCiG1
 SP2gzRlrg4HgePhM9bPEebCkhbSGeyDV8CrkFdcoHy8FS2v6+TpPZEsnshAlDLd5z+SZ
 umKev5elsv5ABZBdn6Gbi+c5JZ6Lda7Vl4xp7hoYAWofbD+3tGQinqp/pJinEbLx4t1d
 YB0YpMwYoSYCjCsqbwLgf5+ea46HB+cuKmBw8jMkvLggsJgQ0cH0FkYebwicdQX13ZQ4
 8ENvDBJrVR2P6ImI1mRq/7W7K/tq1QolOluwFZTYagzHoD7GW0aTujC+/LfUqDjpdEHQ
 c24g==
X-Forwarded-Encrypted: i=1;
 AFNElJ++Ci+S4rUzhjocYnsm6oFqRDXNGyIXVAJpqMm/UQfzPSjwEDVlWAENbIV6dxwI/HZZbzKhWm2roPBG6Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+P+M7nVMLsEx6YRYhrfxPcF1SWFXGBd/D54GJF4VXxCabrD3j
 YhRj8eHKtgLGzMDyQ38zpbyPhfThgkdHvOu9sUOLkIpv/mqzZ/PBzORmk4cQpL9GcVolhftJXFY
 WmmH9sCX5gKIPGJyt+FUMgwSLXzlNqJ0gIjAXe/JlB4TWUs/uUJwq5u5/X3dITUgC/lae/kZ6SA
 FzHeCzjKg=
X-Gm-Gg: Acq92OHBX7A/Xu0sRdxFsDRxISHSFNDqjbItvvpUE28kCqR3YQHEdF6Kn3+CWszuArQ
 iE/mSVqlIG/2c4VkK7bUXfeYPFXN9SNZcKww4YOO/sggzXYT2T3BYmxTPhqb4/7t61UoFKRX+9V
 KcC8/qX7FUUy2hDtU6lQBSsoQbB+NwxDUhaab6jbY8LkovYN46+VVs0VGlnISiRcN0dPYG0NC3M
 n1K6vuVm3vs9KYu0uecKjOmyGmBwW4J4z4vLr06nJgem9QsDI2vuYTvkgBSv0SYK3WgOBICE1qg
 ViDuV15gvVXO84YzsRxRwCfg+chSrpvwhbRfVT4mFbe+l1mbB4eqcNZlfFz2z/grcUB7c6hHEMY
 PykUQYvX+oy5QwH2zoHQs27qbxcclohEQm8kUAhnhTUf8AEl0
X-Received: by 2002:a05:6a00:6b91:10b0:841:71fd:60c4 with SMTP id
 d2e1a72fcca58-84171fd649fmr10382852b3a.4.1779795519477; 
 Tue, 26 May 2026 04:38:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:6b91:10b0:841:71fd:60c4 with SMTP id
 d2e1a72fcca58-84171fd649fmr10382828b3a.4.1779795519008; 
 Tue, 26 May 2026 04:38:39 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84164af10b5sm11685360b3a.15.2026.05.26.04.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 04:38:38 -0700 (PDT)
Message-ID: <2140a893-8959-49d5-83e2-464ec79e0801@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:08:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
 <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a158640 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=StVILoaL_uWnGg5ebB4A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Fl_MmjfBsvJpHhBqSS2HMjJLKR2l0Ii1
X-Proofpoint-ORIG-GUID: Fl_MmjfBsvJpHhBqSS2HMjJLKR2l0Ii1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfX6lVx2h38GTZj
 sX08gHkTXz94E9/MED8Dx0dfg3cNy/KBbc05McaWV/7ibNAVOeCUVt3hvccUm+w04Py0QnKObX4
 6jvYkRsUyS2rVDEjO6dJKmDn3UoxoJg9irZkML6Lsb10f4yU7zJC5RZc+weKX1bMYmWaAmFmWsh
 cYH31Oa0dcK+z1n1ynQdt2m01eSu5pSlv92PjOLZXNIlu/jTqYCMAZN7/j0URLSW1j2EADRRHhL
 v71mXGg0MBD9BMssIvl6zRl84QRv7MSiy8BTRHIeaKN+RNjaNgBzwfIp/Tasdjf9LFI3UTYZ12P
 T71IdzQyou2DyDEyesVW51/nj5CxBfsMGCx8Z7T6f6RJg+Fsl2/zVFcvKuw6YQIv3sDqyt7YMc5
 D/N6jzlwoIM0iynAZobIrpp9w9M1mlqLCDkry40fCjJS4LdTiMaX55OAdd4LcMgcLYOvCI5ZHU2
 KtZrNr8UCEPEm2RzLQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260101
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 6/7] clk: qcom: camcc: Add support for
 camera clock controller for Eliza
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linux-clk@vger.kernel.org,m:luca.weiss@fairphone.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:mturquette@baylibre.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.955];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,oss.qualcomm.com,vger.kernel.org,fairphone.com,st-md-mailman.stormreply.com,gmail.com,baylibre.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 5583A5D4FE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 4:42 PM, Dmitry Baryshkov wrote:
> The camcc and cambistmclkccc drivers looks pretty close to SM8750,
> except for using a different PLLs. Would it make sense to have common
> drivers instead?

Dmitry, on Eliza, CAMCC and CAMBISTMCLKCC are powered by the CX and MX
rails, whereas on SM8750 they use the MMCX and MXC rails. The PLL
types/configurations differ across the two platforms and the frequencies
across rcgs are also updated.

Due to these differences in power domains, PLLs and frequency plans
update reusing the SM8750 drivers for Eliza was not considered.

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
