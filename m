Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41905C65939
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Nov 2025 18:43:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E87D8C628CF;
	Mon, 17 Nov 2025 17:43:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D62ADC5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 15:10:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHACH563571889
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 17 Nov 2025 15:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gP7SZuFmqRobLejfGyt7GbvmhEcle0ex0smMYzsYzKk=; b=OREd6A0F037sF1VT
 OEdbZ4GyZWZJwpHnFFS8IU7If1hIVFXrmL3BgZ9ZyNWTwpe6cD7mu6uIAUNHFw6t
 cqveLssSVTYiCUKSwwHRgXdB8tYDvyLTYMh6wLlBygB648Vcqlqb7i3xQW/cRZse
 JQ7MrA4/kxGCY4nEYqVTyI+H/ed0QmGWVU8UP3f6qSKtuCSZ8e8ptIZqSsMx+H0P
 EmYawz9/IjU81nyrPSHzXrImTthBUtFC4oSM8Yk15TqgQ5sOMwJY1EVDAfkVsymC
 cHFp62K0U+0IPUrqETMBgDVL9DHjzKVuC1qHPpTPnTs7PbS6NU/4ukfC0b72pV2R
 clsrHw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbrth5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 15:10:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3437b43eec4so8282319a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 07:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763392252; x=1763997052;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gP7SZuFmqRobLejfGyt7GbvmhEcle0ex0smMYzsYzKk=;
 b=K1kuvNBuFQW/0ICsw6f/aegD0Sqx3EhjT75W0yUswiNWb2rOAeFYdZaT8+945PIoHT
 MsPReWtUqPwbl9zEljjKgps+jlCrphTLi13EjUexVe9z9A+90GGlN6twip96vZ/TGTRK
 4lLxFlK5fWuRB0g+xletQqgZZgkFBAZ9S0l1g0JX6cpUJBVryzjJFMn4otbtUh46A6ik
 +6yMgaABufNmkQ7vKNZoexMslxBkTD0ehLvUPDoB04MgO09WCtlhrasvaglh7LixPqKU
 GPWlhXXOfXQq9Ds5NaogN0DktN6xKwHGLhgOWu/PUcvBipkPMiv4JSREScf5HDCnWeXL
 iaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763392252; x=1763997052;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gP7SZuFmqRobLejfGyt7GbvmhEcle0ex0smMYzsYzKk=;
 b=uBgUAsKC+tMGvbQk18EFTdLO1x3uE1xAt3tswpAGUZKsNoO6u2yqbeGpmYYnB+eDPL
 vcmQtYETM5hWipkSz4Q6Knq+onuRFRPHF6+7IHQnBT3KY/tgq7YIZkKB9TiAwiT0DQZG
 EYS/TgomEetfmNQKB5LPzGbz+bRsnvYFPwcQb0FQQKKz0iNjO9J4iD2zP2XCpRVBxS3+
 VPMZgVyaBL5G80Bak+xKLOZmW+mrlW7uKTyxW9AgilxDGIZqilq2Xq0aFSthqpRdjKkg
 tKp8M8ipVMDGhRnFByiEUtbcirmogmkVaC4nR2JSyLpLw/RWzVwDQTWOcyXiidQSTwg4
 mhog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjGpOurWV6QU2VN+voPtkvVewIOnDfI2EDT4IN32wcIYSEUlQa3HLfNyqL8hpyI84KRRsx/l9AFBZkJg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzyW+nPnfGzKhihFN3w+/s50oQmK0ruxRezBbcEHD85jD/kuIBm
 oWcoeeAvbcGNr/Molc4h14teIfVAjW3pqVzZUNW+rYWsejU56gAXsJhD6H14HbO0mpD1oztW+Kd
 BGoajx4cgLbdfFwHz7jeVcOZVCo8TTjR2bBJdDtsVhTJtz0lDAQUwVJTJD3ymkr7EVF6rULWoJy
 22KGUiqIo=
X-Gm-Gg: ASbGncs5/sqYgW9LOzURMhduNj8fJ7JiMD7iXPVN/XoK06YVQLms+pZh54nTc+NC9L+
 HYE88LX6VhE4RbZJzNRN7cgdLxSG91QPk54q0Ad240/72TCdyAYiqi0CtdC3QTPwfTSp4j2oC5m
 rMPd+ZZ5tXte7NaRfGgTuOvzL1DlW6M/f51JtG4YPZFugdlXAsZltuQIuYtfnoSbqwuyxM7IS/N
 UKIKHaq5ZZcTCtXgX5hZikdTI4B6S/fO5ufTog9oChsntHPTrIuXC+FeD1k0YNOoRokt1LVSlk/
 pGl0nZpupeRfHvg3lvhVNa5kAxFSIVHz4OOhOCgqYiQb/ifcgGGY7A36QzXTDnRLM+/8h2JW
X-Received: by 2002:a17:90b:514e:b0:341:b5a2:3e7b with SMTP id
 98e67ed59e1d1-343f9ea68aamr15342278a91.4.1763392251663; 
 Mon, 17 Nov 2025 07:10:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbsQ08i3RpDgpHclLMhdgzdyoJ+w6CtMbBeyMNLvGdDTzxKR1J3yh37uQpCSBsZD5+fmLg4w==
X-Received: by 2002:a17:90b:514e:b0:341:b5a2:3e7b with SMTP id
 98e67ed59e1d1-343f9ea68aamr15342231a91.4.1763392251198; 
 Mon, 17 Nov 2025 07:10:51 -0800 (PST)
Received: from [192.168.1.102] ([120.60.57.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343e07d2e5esm18476478a91.17.2025.11.17.07.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 07:10:50 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20251114-perst_ep-v1-1-e7976317a890@foss.st.com>
References: <20251114-perst_ep-v1-1-e7976317a890@foss.st.com>
Message-Id: <176339224773.8361.12189431111845230002.b4-ty@kernel.org>
Date: Mon, 17 Nov 2025 20:40:47 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: luANcTuvfdjkEpSxpX4RCpVasDDCF0Xi
X-Proofpoint-ORIG-GUID: luANcTuvfdjkEpSxpX4RCpVasDDCF0Xi
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691b3afc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=dc-18obONeaZi32LRPcA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyOSBTYWx0ZWRfXxW5HA4edY3ZQ
 hTW4c28j0utppEAyjJcnngIwNZbVN/XcoRthia4T8vvAV/fxvR7j0Qb69tYePuiuhbXMx067Cy4
 xOXT8wyXK75fCtSZInFmFX1yOxGhaXmb6wzIvIYBmnE0cuNbrUTI7dyz+kOlwOwn0mfjKFAhKX7
 VJoJs2A55tOw4wKesHV6DdDogY8PRx46MIUWmw9Kfpg0oqwI6t0rqOal6sBO/HbLSOBXgONcbeF
 je6TyWY9rNSsqLY8toNlD1L7//hrIu2kPQ/bMVS8wI87Qj6qhOWIHIb3tvXBUF8TZd0I53+vL+V
 WgqBt1voFN/VL7RibaDuCscVur98GLBvSxVDw9dfZrE2ZSabMeVUi507BebtjIdnBSxKBrfc7X7
 oYgr9dk7hP4NAGTRhwgCAYojoJbVpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170129
X-Mailman-Approved-At: Mon, 17 Nov 2025 17:43:38 +0000
Cc: linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] PCI: stm32: Fix LTSSM EP race with start
	link.
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


On Fri, 14 Nov 2025 08:45:52 +0100, Christian Bruel wrote:
> If the host has deasserted PERST# and started link training before the link
> is started on EP side, enabling LTSSM before the endpoint registers are
> initialized in the perst_irq handler results in probing incorrect values.
> 
> Thus, wait for the PERST# level-triggered interrupt to start link training
> at the end of initialization and cleanup the stm32_pcie_[start stop]_link
> functions.
> 
> [...]

Applied, thanks!

[1/1] PCI: stm32: Fix LTSSM EP race with start link.
      commit: acca17da9c9f53c0aa05bbdef255213d36dc09db

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
