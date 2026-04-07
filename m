Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Is/JyPf1GnzyAcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 12:40:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E0F3AD077
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 12:40:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CA9CC87ED4;
	Tue,  7 Apr 2026 10:40:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22F3BC030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2026 10:40:31 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6376PaNw1584466
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 7 Apr 2026 10:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=; b=GrPx23sLkh18AeQw
 ov4ZAWjC0IkKxGiLEVl5NOxhU0NBvYV9W/x2BpWGo5PIzwP5g4TL7A9EyZTgE1hb
 Oz1Wc0gWZOQRU2jO7p2Wm4VTCxyp8jLQXWVklX58eYtT8XNgnAQckCaEadO6mkgw
 TRhDxwJrBriOWrC+XN5tuDQb1J4cn0STzd1l9CKIvS35u6YZxtWnyvuaSV1c/hu1
 IJTKxmeoi5cmcUjHXvS+JEjQoZ3iGmk7cOAsoPRpXMz65BOP/V7T4XevPgZc47sc
 NgwVHMGAdAFYdykU9XlU0QfFoLvFVQdIJIxEcg1CgKVRnJNTdwjqNioSN73k9jHz
 NIjIxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9tasy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Apr 2026 10:40:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8d59968444aso59045885a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Apr 2026 03:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775558429; x=1776163229;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=;
 b=QheZe8dk4XI05yPv0c2lZjgubX2mfYteQIOmGEjod2VU9ZP32mnAKUnJrbtSdV504D
 PnfZCy09zvi7uNsdrH2dqjWJpmYUs1E5gfG7OdKofqZDHwjzKLtkyfxOy/gBL0lTUfVz
 Guy/zGIy5bQOBmJM0Zj1GyiT1bOTBt5d6layEYErEG57y2yQrGCFZBBdLQqHVHrCJnlv
 s/eKY6Qis2PEyqz6K4m7tx6p5BYlKI+7OHHX1dHBiniCmE+CjLJFA18ZO2zqa1wG3fUV
 bUyZcUQ46IcDCkNMIDshPTjumPOpkZPHInCQ3IamPEWZnWvosoIXpj3R4D5WhpKawL64
 7Rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775558429; x=1776163229;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=;
 b=LTFdZm4GMsa0+sQ63pL84BxA5e9Q2lwvWyHKG8DJkj5MUzgO/Yg8k7aZ0xMabX84xp
 a2MCN2BJ+8WANasr7dSa4MZiRx9v1p6d+1dSzqeRYtP9SghpsQ7ELpqNklnXrB7EKBSp
 kx4SNBGRyfdQKxJa2DzEPWl6oejnXsLqKIhSgnJfSTQN1ODW+yLUv9UqLwFNf1jb6nc5
 tSbDhBOFVs3URpFrhwonyICSU8otx1hCTqnFNKWfu8oJx55kOFvyxJ275Z3xgiWqDpvP
 OlgeiFYR4/VzEJUKD9PabtVZpr3WWkfTYS0frSeGbM8ng4AFlp5/qiRHvfng1noWHV1s
 Jg6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW72ErlWvkET3En9zIrPelz6U72D13nG+JST9V5m23q3rB7aWP3UJo7qID6SFJHJlc6htI4nXSCJT18CA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyScebfHC/+vVX6yujC5Wz1HSyK/i3Odnhir0GcluEaPqWB6lEn
 1ehGQlO8tlJ88s7bQvP0hRKgVxSu9Cd9EmXV19Pg73HLKM/7TIqsd/PJXC7icK47PMbWA3h1K6A
 uM5nqmfOSg0dufHTr6AhzTdZ5TATmdpUxZcmZLKfmSJ+T+WtCPEeCXfLBvBuHhm+yThO56Yl0lz
 0GDQVRg/U=
X-Gm-Gg: AeBDieuYqxHH8VF8BH4cgF0MJG7mFeHNk/BrMycpLD2ggokDhryXMCXcj+Y8RDzlzeu
 Fzy/Ap4frEPBFl8om96C4VaiSxDyOvssC4WjB8mBtIQ6HWshsphwpgsjxqi6Znpm9jMVm5iyj8F
 NqfnjRzz3+V/UmtgelR7PTv3FTqR282bXtr7M8CaRDVNJ0Xkx0DrDgm/oo4r8xHjcUIkOdD+zdr
 BSG87OCHtY9K2ULm1r7hKwDTy/+kYWXLUQIFYlC+wr31vd/+Bwj9xfurEniJ2cHmafX5wKbngon
 /RSMTlWTFOtRDWuELmjVCusYFWXnaY9ffDBwTUhJCAHZ3rT8otYtsK7SKS+zzThZozSzc5/ZO2I
 rVOzule/wiPlZEQvlJ/FjfpPUZNwEqDimwSQbTD17QWc8Dpr7eWv0rB1K73JrNvwAPpxPWOWFK4
 iKBwE=
X-Received: by 2002:a05:620a:7118:b0:8cf:dbad:263 with SMTP id
 af79cd13be357-8d41bbd4c0fmr1673958485a.7.1775558429282; 
 Tue, 07 Apr 2026 03:40:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7118:b0:8cf:dbad:263 with SMTP id
 af79cd13be357-8d41bbd4c0fmr1673955285a.7.1775558428775; 
 Tue, 07 Apr 2026 03:40:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66e02d44fe1sm4040978a12.9.2026.04.07.03.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 03:40:27 -0700 (PDT)
Message-ID: <623b4ff7-463a-4681-a5be-375ce6fdf90a@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
 <20260403-stmfts5-v3-11-5da768cfd201@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-stmfts5-v3-11-5da768cfd201@ixit.cz>
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4df1e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=edXKPL0xb2b_iQIxsCMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OSBTYWx0ZWRfXy8HJ1O1qKJjN
 k3OMDgo/KXNOCn12GXAJNMO7Dme5A2kaWm1qia0WKCRKamZDnnSTIKYsXFeSpME/nSnOBj+jypN
 Gbf9b2s7DS+YrTdBgbvUl64t5FtKCWVsXq/ymF8Q1ZxB4hQ3a0KZFWf9B5nd3bs8kSSlAcqYylQ
 KPvcvxusmqVWK7kkufooSFeM3qoK7cPT3r9HMwwmBRUM14yXey5tOVif9boYbNT3jYRPjESJzHn
 +xSywEnZIHaqBrz59xn2ndasaOLQAMBrDKuFl2m3ahxZ+mvIkDjvbmLm3hjFGBg3H2C8aZLlovH
 e+lhubzjGvHR6Gonkd/dkdLzuSZjQefOIFqBhKaodVSySSBeuY41rAsXL0VDu6WQ4Zu62F/vbWk
 19lyv9j/JBIlQSGtmaZHTXiK9ysgHM8xbC/ZOPDZtxcXDBeagMDsQzpmFjdRCH6TCan2PYf5neV
 6Ns7u5ZFIdDVtV3qh6g==
X-Proofpoint-GUID: tsJsao0pTAqyKT1oJCsvRGCd6u0KmTfT
X-Proofpoint-ORIG-GUID: tsJsao0pTAqyKT1oJCsvRGCd6u0KmTfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070099
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
 phone-devel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH WIP v3 11/11] arm64: dts: qcom:
 sdm845-google: Add STM FTS touchscreen support
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:dmitry.torokhov@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:petr.hodina@protonmail.com,m:linux-input@vger.kernel.org,m:phone-devel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,protonmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[ixit.cz,gmail.com,foss.st.com,kernel.org,bitmath.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	NEURAL_SPAM(0.00)[0.379];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,qualcomm.com:email,protonmail.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 32E0F3AD077
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 7:08 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.

I was really hoping for an advanced touchscreen!

> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
