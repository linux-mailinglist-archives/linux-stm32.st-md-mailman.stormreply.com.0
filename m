Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 442DDA83AC1
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 09:19:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0803AC7A841;
	Thu, 10 Apr 2025 07:19:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C12D4CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:33:44 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539IBnXB015752
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 10 Apr 2025 01:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=o4YCBs8FmN8c+rLkfX0n/GYc/hIsRtQHN30
 6R9U8pDs=; b=EQep3k1dgrfwrP4L4bmrmLVvxPPZjS3+YIeMB+dHQN0VE0/ohvn
 MG+Frm8EO62lESL7ctAgwGEfDgoiLY4ivlXv4htAOhiQHS8TsPldcIz52ZKjwA/p
 FLIZKW2pPRY94W7U9NvtgjLEETqwSdfXOaEC/SgxabTWmt3bKc+u/Bv/JlfQP0jk
 YWYS6dlxVZL2w03o4SYALNDc6084IpYZn+TpLo3729kD6Q5rzzRar7Mgftaz/Fll
 nEAGGjZ6iE9YESgs4nGstNqv1Ydf4t5HxX6gT94C06tzPKuRERUzf9CtusyAEi/r
 hNlCSF1zHH9ZNdW+PQQHoWhCB1GqsDO/nNA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2w6dd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:33:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-227a8cdd272so2481945ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Apr 2025 18:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744248822; x=1744853622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o4YCBs8FmN8c+rLkfX0n/GYc/hIsRtQHN306R9U8pDs=;
 b=gHVDNngbDvI2MnAhHKvYzryMEWziNdbVR7Rf6iKzzoH1x3ugwLhQ7tqTMa6OJVCkzA
 wUHFdP9go5CO5kqYCgW0+r0v2QGqf2jZxHAyF8JpnNea6xXRyqhMP7TzEPGawPy4t4Ti
 rA1tiUUgt3/B0/THfDhAlGkQg0BWKx7BzNbfLWdFRqn0zZCuK6EMoTbl8yrrJni6w1q1
 l1Rnfcj2zjCSoX5rU+TbmqhRLyUrCscDzeXYGbLSzr0IfXRiPeq9s61DucAxz/MANomg
 7m3eVpjq6bH0RNsyXJdy7mYHDM03zIwAqQMqZPzolDygR49YpNT/dvGKq/0r0EJTaMB2
 jOSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyHH6YLYtsiSbFQw75YsK6280mvfCSpqaW7HcAIa1JQOKP9mHTDulqFbhV38fWwlcnErzQgvIEXYUCPA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzRZHsh7C3hKLpYzELER6GlncBnj7QFHH+5b1lldqCpzJ1wUrt2
 +FDNiRMEf/uQCaP7OspOfKCY4O7g1Et6dCTYX4pBLtmmKEfO73uo8Cg/RfQ08X9iSWejCwiO7Sw
 6iynNudLlfqT4C/U/YkhYE58qqt55cdQx0hUfZSbyOzzSSmVKBkg9nmyzxRmxfyLtnOcpfIRJEX
 sAXp0=
X-Gm-Gg: ASbGncsjtfc1iRLIvVvruHmwkvKJ7eqc1EquztXr5C0OEha+kyUrsd40upDqGqGLz2B
 980TyuvWGbR++QccjEZiUz11U13CSVB7kVLgkWPXsh5H2Sj1/Yjf7BbsnCXTPwXx8Y5YisWxF/1
 lQ2z6qLk5qegzk4ztFIqcjlvVlU6YZ/kKPWRobicDsyb82XJY7Km9V3yS7a56EDen4clTHbKwq5
 FZaQv6EUDYWlq7tBChaSDaw4GsllLh1XW1JpeazWkNcV1zVrjzL3UcuwD6wcRLfvzrMgf8xHmtL
 +Ab0/kuo/CY/gNmf5Fk4/aAJSxSqgta6Hv2iUlc5ynXyPEFP51xxVOFK1a2FrJzR//lrrmg=
X-Received: by 2002:a17:903:2341:b0:21f:61a9:be7d with SMTP id
 d9443c01a7336-22b42c43ec6mr17770835ad.49.1744248821384; 
 Wed, 09 Apr 2025 18:33:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrJkqX4uEGOsPxZGHknz/7ZYzO+UEvc0pWxjPjlCLTKvbNT3cRK56FqUF1D3OsFviQrio7Tw==
X-Received: by 2002:a17:903:2341:b0:21f:61a9:be7d with SMTP id
 d9443c01a7336-22b42c43ec6mr17770205ad.49.1744248820641; 
 Wed, 09 Apr 2025 18:33:40 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 18:33:39 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 09:33:25 +0800
Message-Id: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: epuhJkAlvrZ_IowHeSDQAjtgNZxksCCT
X-Proofpoint-GUID: epuhJkAlvrZ_IowHeSDQAjtgNZxksCCT
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f71ff6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=ZTg50iMYVFS0dohvRPoA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1011 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100010
X-Mailman-Approved-At: Thu, 10 Apr 2025 07:19:28 +0000
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/5] coresight: ctcu: Enable byte-cntr
	function for TMC ETR
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

The byte-cntr function provided by the CTCU device is used to transfer data
from the ETR buffer to the userspace. An interrupt is tiggered if the data
size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions and the read function
will read the data from the ETR buffer if the IRQ count is greater than 0.
The read work will be conducted ASAP after the byte-cntr is started.
Each successful read process will decrement the IRQ count by 1.

The byte cntr function will start when the device node is opened for reading,
and the IRQ count will reset when the byte cntr function has stopped. When
the file node is opened, the w_offset of the ETR buffer will be read and
stored in byte_cntr_data, serving as the original r_offset (indicating
where reading starts) for the byte counter function.

The work queue for the read operation will wake up once when ETR is stopped,
ensuring that the remaining data in the ETR buffer has been flushed based on
the w_offset read at the time of stopping.

The byte-cntr read work has integrated with the file node tmc_etr, e.g.
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the ETR file nodes with byte-cntr function:
1. BYTECNTRVAL register has configured -> byte-cntr read
2. BYTECNTRVAL register is disabled -> original behavior, flush the etr_buf

We still can flush the etr buffer once after the byte-cntr function has
triggered.
1. Enable byte-cntr
2. Byte-cntr read
3. Disable byte-cntr
4. Flush etr buffer

Since the ETR operates in circular buffer mode, we cannot fully guarantee
that no overwrites occur when the byte-cntr read function reads the data.
The read function will read the data ASAP when the interrupt is
triggered and we should not configure a threshold greater than the
buffer size of the ETR buffer.

The following shell commands write threshold to BYTECNTRVAL registers.

Only enable byte-cntr for ETR0:
echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val

Enable byte-cntr for both ETR0 and ETR1(support both hex and decimal values):
echo 0x10000 4096 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val

Setting the BYTECNTRVAL registers to 0 disables the byte-cntr function.
Disable byte-cntr for ETR0:
echo 0 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val

Disable byte-cntr for both ETR0 and ETR1:
echo 0 0 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val

There is a minimum threshold to prevent generating too many interrupts.
The minimum threshold is 4096 bytes. The write process will fail if user try
to set the BYTECNTRVAL registers to a value less than 4096 bytes(except
for 0).

Way to enable and start byte-cntr for ETR0:
echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Testing case has conducted for the byte-cntr read work:
1. Setting the buffer_size of the ETR as large as possile, here is for ETR0
   echo 0x1000000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size
2. Setting the threshold for the ETR0 to 0x10000
   echo 0x10000 > /sys/bus/coresight/devices/ctcu0/byte_cntr_val
3. Enable ETR0
   echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
4. Enable ETM0 as source and enable byte-cntr to read data
   echo 1 > /sys/bus/coresight/devices/etm0/enable_source;
   cat /dev/tmc_etr0 > /tmp/file_byte_cntr.bin &
5. Disable ETM0
   echo 0 > /sys/bus/coresight/devices/etm0/enable_source
6. Disable byte-cntr and flush the etr buffer
   echo 0 > /sys/bus/coresight/devices/ctcu0/byte_cntr_val;
   cat /dev/tmc_etr0 > /tmp/file_etr0.bin
   ls -l /tmp

-rw-r--r--    1 root     root      12628960 Apr 28 17:44 file_byte_cntr.bin
-rw-r--r--    1 root     root      12669296 Apr 28 17:45 file_etr0.bin

7. Deal with the file_etr0.bin with following command:
   dd if=/tmp/file_etr0.bin of=/tmp/file_etr0_aligned.bin bs=1
count=12628960 skip=40336
   ls -l /tmp

-rw-r--r--    1 root     root      12628960 Apr 28 17:44 file_byte_cntr.bin
-rw-r--r--    1 root     root      12669296 Apr 28 17:45 file_etr0.bin
-rw-r--r--    1 root     root      12628960 Apr 28 17:49 file_etr0_aligned.bin

8. Compared file_byte_cntr.bin with file_etr0_aligned.bin and identified
they are competely same.
   diff file_byte_cntr.bin file_etr0_aligned.bin

=======================
Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

Jie Gan (5):
  coresight: tmc: Introduce new APIs to get the RWP offset of ETR buffer
  dt-bindings: arm: Add an interrupt property for Coresight CTCU
  coresight: ctcu: Enable byte-cntr for TMC ETR devices
  coresight: tmc: add functions for byte-cntr operation
  arm64: dts: qcom: sa8775p: Add interrupts to CTCU device

 .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 ++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
 drivers/hwtracing/coresight/Makefile          |   2 +-
 .../coresight/coresight-ctcu-byte-cntr.c      | 119 ++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c |  88 ++++++++-
 drivers/hwtracing/coresight/coresight-ctcu.h  |  49 ++++-
 .../hwtracing/coresight/coresight-tmc-core.c  |  29 ++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 175 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  10 +-
 9 files changed, 483 insertions(+), 11 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
