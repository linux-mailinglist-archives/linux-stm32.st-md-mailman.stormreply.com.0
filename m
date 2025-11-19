Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12784C6F1DF
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 15:04:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FD95C56611;
	Wed, 19 Nov 2025 14:04:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCD64C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 14:04:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AJDX6Om827426
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 19 Nov 2025 14:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5eyCNmwWmDeNycXwiGh5ANHQUbpJfYnNW5Wx/BlGZLw=; b=hlANfVQU4adiwS26
 xTp9AC4R0M2msa6V9XVu3RrqwzGNAMicSjFkyErG8NHMKbQRH74rKyERzqGxY3W7
 NnrpbyGfQtqs6II959agMcFjTg1+77J9HL12fUsZEqh/XhN2ws2wivVKhJN0DKs1
 pncSt9AVjZ1Dsb8muflVgiTJNcXhfbgsh9Ex/VfeorMx5o+1LMjhiK0+Xyjfougm
 sDn6HSkHYFHtfrekP1F8Wly8wixwGP9vrZf7ORk5jILEva6NbsnNJi396aXapi3v
 3PKphYB8KokgvXFRFpajjs4hyHlgkKVfl3ZsG4K1MjYWk+WuMWho41injpMUMJLn
 5FULYw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah88w9cdp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 14:04:28 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-559ab9b8b24so744447e0c.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 06:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763561067; x=1764165867;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5eyCNmwWmDeNycXwiGh5ANHQUbpJfYnNW5Wx/BlGZLw=;
 b=J8zfLTRLNHWjmDCShSpLrf47wx+47VS4BhVfw/V8UfLeDqgI3jSHc0uY8+sQ32Se0f
 RdoQLMdfM/Ka7ptmtNeUhFgSRfvK8//v5YKMGZpCQw3kd3hWIOkenGIce8/D2Ewag4VF
 4WuPPqAA1LNGG+exN3y4gDVhfioEKWgE79e+10f5aYwIsmPzEl8igl9+5P5DkKqtAzEU
 4XGo87jMsvkIeX+FuyjKuqCG0lcIHeYGQN93P7Oc9ryhMIkK+GengrINVDKAM8IAGcjJ
 i5Qr/6VjwONIs2JLil9M8ppdtHKjm3B1VKTJIH7doncO+6H4Taf55rbX/JeE4dmh0qVB
 ebbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763561067; x=1764165867;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5eyCNmwWmDeNycXwiGh5ANHQUbpJfYnNW5Wx/BlGZLw=;
 b=jKO+H0nuqezfFkt7QoezlOPQJDEyPPWGQM4uEPgxTrk0M0p0QEiBggbsN1dv0/Vd5V
 NSPav70C9jzbku6FAzBLQK2MY6VsWz8zCfOHA1a1RcUottMqhQMna+HNLfJpjWFsSWVr
 IkS5XcxB4eyq/g1GWo89uuh3PaWQyLKgnbTdI0u1+Xn8WjwWVE3aBbEZ7vfoIh1Pm12j
 FEdFbRLaYMkzigKI9OqbygHdnz4Lvsj3tMaE/zvqnDa/cYJQ0ggqukpnJnkDQipPpiOI
 iffikqrSYllqfeomLckVN9Q213NRGFOXHJHsac/ns2D8RDpIgy5HWP4U42+4aj4aCp15
 xfZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5MVPcegNCLSHXY6Dc2U6MjpLSZLA3j2GgpTjq1voEGxml/dZCM5yD9iEeMlgU3lM5U+awhA17kV/OXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywdr+8cExcYlI2hQOOL1xc7OY0giCbIwxI2aXx0/lV53rTaDpNZ
 l9c/oJbQy91Ks1V+Q5sluJK8Vu+c8zZw4KCJpT4QT1JZa2GKRvv7RFh9s9tZgJbD0yaei+KOre0
 /Oy0HCeskLGYT2mIQt4TH5MicB61Yd9fKl+AAn4estby2NW8t9nMEpmHWgb4Q8mGuC2IgOrb8RO
 kDb7z7WpM=
X-Gm-Gg: ASbGnctmSrBBlsSwvMFF1EGkIihrALk7ntcHJM4jaIspOUee53bvrZR2qjZApbydV6D
 gok6SJD6WTtPkKSZRckLZyfYtXE4ENqFvk+N5ZJ3AlXGYFCx5I0hi2vlSfwj5HhnARK+5N/CeHh
 K+Bx9ikngEFqXq//GEJexiSV/vQBhODm+Oj3e+cAr9rTcSRb2FDB1k6I1dzBL8CMQqbB/5fau5B
 ZkM7PPA908/VnnckQhsFSCYTxxkQ6Esjc7wiKirEHktHeow7tVhGm/EOHWLt6s0apS0Snojnfcz
 dHlyvpuyzbNHtbLtLDj10kgbQaD4LoPyiQMxHLXOxd92zcCSMxoOna0oRHDbyV3fBpoOXQco+ke
 vKUybebF7Cfj/moAJG/0iffTIcaaykmA3f8agQDv2anKAC13Brz7Sld+iC5zGYj8PXcQ=
X-Received: by 2002:a05:6123:542:10b0:559:a30f:1648 with SMTP id
 71dfb90a1353d-55b5ffb13eamr1091211e0c.0.1763561067009; 
 Wed, 19 Nov 2025 06:04:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGozAIOyuCaP/CpSUrDdBNesIlCHdEhqQKyEjU3wClthJpKPW+79NQz3R96LxB0U2cncCgMVA==
X-Received: by 2002:a05:6123:542:10b0:559:a30f:1648 with SMTP id
 71dfb90a1353d-55b5ffb13eamr1091177e0c.0.1763561066565; 
 Wed, 19 Nov 2025 06:04:26 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a497ffdsm15258514a12.21.2025.11.19.06.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 06:04:25 -0800 (PST)
Message-ID: <76d153cf-8048-4c6f-8765-51741de78298@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSO-0000000FMrF-3uB1@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vLgSO-0000000FMrF-3uB1@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDExMiBTYWx0ZWRfXywI4rzeDqnk+
 HDcJbX/gPT6/x+4CQasIei7FtNvSvp6xMawroVTdKBX7OtCwwt+d0jNA1/gW4T117zbEn9F7yo4
 rX8oGD37IubjaxzPKg4k+jau9LEGWr448K/5WVCqZxCppH/btVFyfL3zVqde0ayOL66nTDUoNiO
 O2SInNlxCXynsRd01+ousBQkxtZbrNob/j8rK6UfIKS27Mx1HBu8bILh6n4UNU3GlbLdJsqzdx8
 6uu/Dzu/VS+le0pkACUKA3fgRF9uY4/iv6g/OLskIsP0wrUegpyaJkO26DL2ih9gEvvACGS+Utz
 xGTYjo2V+kYPHmEwklvooOOfgqAbc6rx8Ai6yEn55lb3PW+IybrlTDfqhBGaQKdHVM29mF6I3fn
 P7xfy7cQJV9RwHgR2yzcCViyD7uUDQ==
X-Authority-Analysis: v=2.4 cv=YKqSCBGx c=1 sm=1 tr=0 ts=691dce6c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=jDdzDUYIFSdt8Bpb0fgA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: wK5e0ccHYaT0a5JTU67wHtZb2KPC95bQ
X-Proofpoint-GUID: wK5e0ccHYaT0a5JTU67wHtZb2KPC95bQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190112
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: qcom-ethqos:
 use u32 for rgmii read/write/update
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

On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
> readl() returns a u32, and writel() takes a "u32" for the value. These
> are used in rgmii_readl()() and rgmii_writel(), but the value and
> return are "int". As these are 32-bit register values which are not
> signed, use "u32".
> 
> These changes do not cause generated code changes.
> 
> Update rgmii_updatel() to use u32 for mask and val. Changing "mask"
> to "u32" also does not cause generated code changes. However, changing
> "val" causes the generated assembly to be re-ordered for aarch64.

No changes, on clang 21.1.5 at least

> 
> Update the temporary variables used with the rgmii functions to use
> u32.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
