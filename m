Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 557EBC6593A
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Nov 2025 18:43:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AC86C62D20;
	Mon, 17 Nov 2025 17:43:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C07AC5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 17:17:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHGOrZl4103602
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 17 Nov 2025 17:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i93olX92WqAcMU2/NsjuIGXAvZ22y9Ah3If85Gfr8Ow=; b=mSKJsYvNcgJG2DO+
 S3tSss88S85wvJ3o7N7LILxkPDMEHZVJaKyjDJ1DucgTVWlrLjtZF5tRrL4Y7QZm
 nIoMyZ16FrhfHwgPiyC7T3Pu4KJ5xRIVWR7WazUT5RPZNiw/51VcxnE2BnSn1j1K
 dsJnghBkf4o7mttt7xjzcgVlZx9gvaAtezl6DXMJaPTYsBfKJiwshwJ1vMl4rIlL
 eIUzS/ZXD6wKoH2Yb+qXAh3e2VIlVobf4oHSXgcEVQWImqv33MAHcrFgi8T5uoka
 exxNKi5SEz0/FYMQkZmTcTRL8Gm4y5K7wPZcCvpcCcyOvpA7Kj6W8hxPn/9GnNIx
 L4dfQw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag773r5cv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 17:17:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-297fbfb4e53so81277375ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 09:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763399873; x=1764004673;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i93olX92WqAcMU2/NsjuIGXAvZ22y9Ah3If85Gfr8Ow=;
 b=bM10tfMmsmDvp095bNbFBB/iE+NDccRmA4uLgSPR2C99u1i+0cx7Wm+NcA8I+4Z0ul
 4/Fx3gBsxQvTbLcj6Yi1rUoTc83s5XWkKR2IUjiAaRM4HMJIIxVYQRxGebg4n4yJpoAf
 ajcYNXGiLf+sMFXAMsYbBIvjXa3a7j0qPzv6xRVPoJLpn7Os2c820mLPhwvQdK3EnHp5
 i1Yc4U+PBqG1bxvClH0VM7K4v+cyfAhbhIeBnKvP7JXcpO2KHGI8pxYDin6WBhv1gLyM
 slzl5RFASq+ihoHooPOpVPowCzvStnHPbDbI9L51P0GUZEqxwFeEF8PmzibaZcxsvs6e
 A6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763399873; x=1764004673;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i93olX92WqAcMU2/NsjuIGXAvZ22y9Ah3If85Gfr8Ow=;
 b=xJCkjJcoinduNjlQgZHQ28A9CY+9RfJ6J/CCs4ytL0ZV9D1Sf7xyZuSAJk4BumMrp/
 RRactlal7poD0fguwKkNOBpNtTE3IdQR3wbZnIMJl9/eR3KNvLSHAvMGCq8wxEYc50q4
 ZQBD0orLYfqOsVSvwJHr6hau386N8tCPauquXbCzi0WL/RB+P+CGR6tl25BhvcIF/axO
 OAc6OYv2u9kyAZyFED7z2q+wzkm0Cel//6YB7REODR8NxTb9ZqAsao6UxHdXFgAJWBEG
 7H4l0fK2YXGQCHAO+3/QUC71zw0WJK4IkqL/uWLwUMptsLNXNhtdPtsmVvcX+ErsvEIH
 STFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZz0FvauVCGTm2ONXhcAYf/jcVh4TLAHHJ8lrR0ffvyFVDtjnMsx5bmyOwkCR3JxyfrgN2VvOtpkc5gg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw0speSWy8oVntK8pyCmUYg5WqC2Z3TRfRVb91LtKJrlSD95BMG
 ZfGrSE5AKNuUqbR/hl/ofz6L8bwPOIFK6ZV/FAw3iyTDxi41XUwqnq/AwXGXeEyScIwhZ3hOes8
 GwY5vZBGyMyTNcI519B+ou4Q3Toz2sVHPGNh/X0c5jLzfZ+HyG7nceAUWHZP/wQG3H4tk3lUWSP
 jgwiqcp8g=
X-Gm-Gg: ASbGncs/Fr44F8ZLjARmjWzk/j4XGinP8IcrzD6066IvA2UrI1hCKI7tVtd4T2no9kt
 SsPZYpjuOoZXTe/LEghHSaoRx8vN2LYC2pgWPB6d//qRIS95vjVXCj8Ckh37PQNAnD5tfGvjJ4v
 c2ktkwZBiJvuD+oAdZArA00LPDb8dCmGI7bjDBgLpmCmm9GoBA00lNuS1C8RlPWpYyMZfABHW+X
 22yloVifvv6ldQRgTXORKRGPNV3XUeDosNElSNBZ6C/Sm7ihTjcYukvQBlDCieG2G2deIrpIn5z
 9MHBhTr3sA58CM3GKCRDer/yCYrTvllayiIPRNCFhBrRVWau0Aj/gA/yrg9smxd+I5Nj7RBK
X-Received: by 2002:a17:902:d607:b0:295:6a69:4ad5 with SMTP id
 d9443c01a7336-2986a75e3abmr163279085ad.56.1763399873600; 
 Mon, 17 Nov 2025 09:17:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXqHYNFy2gFUByh/xB5XQrlDQJxkWr13L5mGpmFTI1mFj2T5raib6vRXVu9+YiT1oOKIIsdw==
X-Received: by 2002:a17:902:d607:b0:295:6a69:4ad5 with SMTP id
 d9443c01a7336-2986a75e3abmr163278645ad.56.1763399873107; 
 Mon, 17 Nov 2025 09:17:53 -0800 (PST)
Received: from [192.168.1.102] ([120.60.57.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2b06b6sm146804555ad.55.2025.11.17.09.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 09:17:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20251114-atu_align_ep-v1-1-88da5366fa04@foss.st.com>
References: <20251114-atu_align_ep-v1-1-88da5366fa04@foss.st.com>
Message-Id: <176339986701.12619.4602667156488973060.b4-ty@kernel.org>
Date: Mon, 17 Nov 2025 22:47:47 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE0NyBTYWx0ZWRfX7dINA2HaZdS1
 fb/Q4xNrx8ZYSoX2PE4vaBW9A7TNA2Y77N6UdEKWztu5oL05rFwbkYUIYMDZUIriosp8JL2a+2Q
 wmp4xaX12xaoMfPrHQ3VmT2eBsg0QvJUW2qcQ94jId0gsmbx7Pjdm5dSgAftrM3dCmPg2U0qp1n
 FEF5JdyFrPEYb3ATYs2Ll/R1XXJGfbjujBvFnd8x6p2RFAkhbofsZAcv0T110zzgnIMfwxFYhby
 nELiDYreiJB1SXu73nzQ760rljjp6APRIZCxDVJlwAPW+gRjQKW06Of6LOT8HHAkVvMb8s6zc8U
 yE9mqvaFUUWV/Sx9nFbOdgOVcrM4FT7XmiM7WPoiX6lDLAQquDmfIlPNgTMDn5Ru6U3QpG2MoEo
 /15CM2XYWDAXCaRCEsGs2aKNW5Zfbg==
X-Proofpoint-ORIG-GUID: n7ueHOnl08FGWotOjzXCjb0ZjXaEAPHX
X-Proofpoint-GUID: n7ueHOnl08FGWotOjzXCjb0ZjXaEAPHX
X-Authority-Analysis: v=2.4 cv=J6OnLQnS c=1 sm=1 tr=0 ts=691b58c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=do5hrM8nwbRZ-HPJZGUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170147
X-Mailman-Approved-At: Mon, 17 Nov 2025 17:43:38 +0000
Cc: linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] PCI: stm32: Fix EP page_size alignment
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


On Fri, 14 Nov 2025 09:08:05 +0100, Christian Bruel wrote:
> pci_epc_mem_alloc_addr() will allocate the cpu addr from the ATU
> window phys base and a page number. The resulting cpu addr must be
> correcly aligned with the ATU required alignment.
> 
> 

Applied, thanks!

[1/1] PCI: stm32: Fix EP page_size alignment
      commit: cf2eff021ee3c179a4ec4a6c1d34a27fd92b8acf

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
